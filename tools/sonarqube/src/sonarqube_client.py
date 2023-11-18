import json
from typing import Any, List

import requests
from requests import HTTPError
from requests.auth import HTTPBasicAuth
from urllib.parse import urljoin


class SonarQubeClient:
    def __init__(self, host_url="http://localhost:9000", username=None, password=None, token=None):
        self.host_url = host_url
        self.username = username
        self.password = password
        self.token = self._get_token_from_file(token) if token else None
        self.session = requests.Session()
        self.session.headers.update({
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        })
        if self.token:
            self.session.auth = HTTPBasicAuth(self.token, '')
        else:
            self.session.auth = HTTPBasicAuth(self.username, self.password)

    def _get_token_from_file(self, token):
        if token.startswith('file://'):
            file_path = token.replace('file://', '')
            with open(file_path, 'r') as file:
                return file.read().strip()
        return token

    def _request(self, api_path: str, method: str = 'GET', data_key: str = None, ps: int = 0, **kwargs: object):
        url = urljoin(self.host_url, api_path)
        if ps == 0:
            # No pagination
            response = self.session.request(method, url, **kwargs)
            response.raise_for_status()  # Throw exceptions for HTTP errors
            return response.json() if data_key is None else response.json().get(data_key, {})

        # Pagination
        page = 1
        all_data = []
        while True:
            params = kwargs.pop('params', {})
            params['p'] = page
            params['ps'] = ps
            response = self.session.request(method, url, params=params, **kwargs)
            response.raise_for_status()  # Throw exceptions for HTTP errors
            response_data = response.json()
            page_data = response_data if data_key is None else response_data.get(data_key, [])
            all_data.extend(page_data)
            paging = response_data.get('paging', {})
            if paging.get('pageIndex', 1) * paging.get('pageSize', ps) >= paging.get('total', 0):
                break  # Exit when all pages have been retrieved
            page += 1

        return all_data

    def user_permissions(self, prj_key: str = None):
        _params = {"projectKey": prj_key} if prj_key else {}
        return self._request("/api/permissions/users", ps=100, params=_params, data_key='users')

    def group_permissions(self, prj_key: str = None):
        _params = {"projectKey": prj_key} if prj_key else {}
        return self._request("/api/permissions/groups", ps=100, params=_params, data_key='groups')

    def projects_list(self):
        _projects = self._request('/api/projects/search', ps=100, data_key='components')
        return _projects

    def project_branches(self, prj_key: str):
        branches = self._request('/api/project_branches/list', params={"project": prj_key}, data_key='branches')
        return branches

    def project_main_branch(self, prj_key: str):
        branches = self.project_branches(prj_key)
        for branch in branches:
            if branch['isMain'] and branch['type'] == 'BRANCH':
                return branch['name']
        return 'main'

    def project_repository(self, prj_key: str):
        try:
            alm_binding = self._request('/api/alm_settings/get_binding', params={"project": prj_key})
            return alm_binding
        except HTTPError:
            return {}

    def groups(self):
        _groups = self._request('/api/user_groups/search', ps=100, data_key='groups')
        return _groups

    def group_users(self):
        _group_users = []
        groups = self._request('/api/user_groups/search', ps=100, data_key='groups')
        for group in groups:
            if not group["default"]: # We don't need to list users in the default group
                a_group = {"name": group['name'], 'users': []}
                a_group_users = self._request("/api/user_groups/users", ps=100, params={"name": a_group['name']},
                                              data_key='users')
                for user in a_group_users:
                    a_group['users'].append({'login': user['login']})
                _group_users.append(a_group)

        return _group_users

    def portfolios(self):
        try:
            _portfolios = self._request('/api/views/search', ps=100, params={"qualifiers": 'VW'},
                                        data_key='components')
            return _portfolios
        except HTTPError:
            return []

    def global_permissions(self):
        _user_perms = self.user_permissions()
        _group_perms = self.group_permissions()
        _global_perms = {
            'users': _user_perms,
            'groups': _group_perms
        }
        return _global_perms

    def projects(self):
        _projects = []

        for prj in self.projects_list():
            p_data = {}
            p_key = prj['key']
            p_data['key'] = p_key
            p_data['name'] = prj['name']
            p_data['main_branch'] = self.project_main_branch(p_key)
            p_data['repository'] = self.project_repository(p_key)
            _projects.append(p_data)

        return _projects

    def project_permissions(self):
        _projects = []

        for prj in self.projects_list():
            p_data = {}
            p_key = prj['key']
            p_data['key'] = p_key
            p_data['name'] = prj['name']
            p_data['permissions'] = {
                'users': self.user_permissions(p_key),
                'groups': self.group_permissions(p_key)
            }
            _projects.append(p_data)

        return _projects

    def quality_profiles(self, include_defaults=False, project=None):

        params = {'project': project} if project else {}

        _all_qps = self._request('api/qualityprofiles/search', params=params, data_key='profiles')
        if include_defaults:
            return _all_qps

        _qps = []
        for qp in _all_qps:
            if not qp['isDefault']:
                _qps.append(qp)
        return _qps



if __name__ == "__main__":
    client = SonarQubeClient(token='file://.sq-token.pat')

    # res = client._request('api/projects/search', ps=1, data_key='components')
    # print(res)
    # res = client._request('api/alm_settings/list')
    # print(res)
    # res = client._request('api/alm_settings/list', data_key='almSettings')
    # print(res)

    res = client.quality_profiles()
    print(res)
    res = client.quality_profiles(project='org.elefevre:iac')
    print(res)
    # res2 = client.quality_profiles(include_builtins=True)
    # print(res2)
