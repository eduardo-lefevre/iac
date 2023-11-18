#! /usr/bin/env python
import os
import sys

from sonarqube_client import SonarQubeClient
from src.helper_funcs import _norm, _sorted_quoted, _res_name


def groups():
    for group in sonar.groups():
        print(f"""
import {{
  id = "{group['id']}"
  to = sonarqube_group.{_norm(group['name'])}
}}
""")


def group_users():
    group_users_list = sonar.group_users()
    for group in group_users_list:
        for user in group['users']:
            print(f"""
import {{
  id = "{group['name']}[{user['login']}]"
  to = sonarqube_group_member.{_res_name(group['name'], user['login'])}
}}
""")


def portfolios():
    for portfolio in sonar.portfolios():
        p_key = portfolio['key']
        p_name = portfolio['name']
        print(f"""
import {{
  id = "{p_key}"
  to = sonarqube_portfolio.{_norm(p_name)}
}}
""")


def global_permissions():
    l_global_pems = sonar.global_permissions()
    p_user_perms = l_global_pems['users']
    p_group_perms = l_global_pems['groups']
    for user_perm in p_user_perms:
        if len(user_perm['permissions']) == 0:
            continue
        print(f"""
resource "sonarqube_permissions" "{_res_name('global', 'user', user_perm['login'])}" {{
    login_name  = "{user_perm['login']}"
    permissions = [{_sorted_quoted(user_perm['permissions'])}]
}}""")

    for grp_perm in p_group_perms:
        if len(grp_perm['permissions']) == 0:
            continue
        print(f"""
resource "sonarqube_permissions" "{_res_name('global', 'group', grp_perm['name'])}" {{
    group_name  = "{grp_perm['name']}"
    permissions = [{_sorted_quoted(grp_perm['permissions'])}]
}}""")


def projects():
    for prj in sonar.projects():
        p_key = prj['key']
        p_name = prj['name']
        p_main_branch = prj['main_branch']
        p_repo = prj['repository']
        print(f"""
################################################################ 
## Project: {p_name} ({p_key})        
################################################################
        
import {{
  id = "{p_key}"
  to = sonarqube_project.{_norm(p_name)}
}}

import {{
  id = "{p_key}/{p_main_branch}"
  to = sonarqube_project_main_branch.{_res_name(p_name, p_main_branch)}
}}
""")
        alm = p_repo.get('alm')
        if alm == 'github':
            print(f"""import {{
  id = "{p_key}/{p_repo['repository']}"
  to = sonarqube_github_binding.{_norm(p_name)}_github
}}
""")
        elif alm == 'gitlab':
            print(f"""import {{
  id = "{p_key}/{p_repo['repository']}"
  to = sonarqube_gitlab_binding.{_norm(p_name)}_gitlab
}}
""")
        else:
            print(f"# Project '{p_name} ({p_key})' does not have a valid ALM configuration!")

        qps = sonar.quality_profiles(project=p_key)
        for qp in qps:
            qp_id = f"{qp['name']}/{p_key}/{qp['language']}"
            qp_res_name = _res_name(p_name, qp['name'], qp['language'])
            print(f"""import {{
  id = "{qp_id}"
  to = sonarqube_qualityprofile_project_association.{qp_res_name}
}}
""")


def project_permissions():
    for prj in sonar.project_permissions():
        p_key = prj['key']
        p_name = prj['name']
        p_permissions = prj['permissions']
        print(f"""
################################################################ 
## Project: {p_name} ({p_key})        
################################################################""")

        for user_perm in p_permissions['users']:
            if len(user_perm['permissions']) == 0:
                continue
            print(f"""
resource "sonarqube_permissions" "{_res_name(p_name, 'user', user_perm['login'])}" {{
    login_name  = "{user_perm['login']}"
    project_key = "{p_key}"
    permissions = [{_sorted_quoted(user_perm['permissions'])}]
}}""")

        for grp_perm in p_permissions['groups']:
            if len(grp_perm['permissions']) == 0 or grp_perm['name'] == 'sonar-administrators':
                continue
            print(f"""
resource "sonarqube_permissions" "{_res_name(p_name, 'group', grp_perm['name'])}" {{
    group_name  = "{grp_perm['name']}"
    project_key = "{p_key}"
    permissions = [{_sorted_quoted(grp_perm['permissions'])}]
}}""")


def quality_profiles():
    for qp in sonar.quality_profiles():
        print(f"""
import {{
  id = "{qp['key']}"
  to = sonarqube_qualityprofile.{_res_name(qp['name'], qp['language'])}
}}
""")


if __name__ == "__main__":
    args = sys.argv
    if len(args) < 3:
        print(f"Usage: {os.path.basename(args[0])} command <Token> <SonarQube URL>")
        sys.exit(1)

    if args[1].startswith('_'):
        print(f"Invalid command: {args[1]}")
        print(f"Usage: {os.path.basename(args[0])} command <Token> <SonarQube URL>")
        sys.exit(2)

    global sonar
    sonar = SonarQubeClient(token=args[2], host_url=args[3])

    globals()[args[1]](*args[4:])
