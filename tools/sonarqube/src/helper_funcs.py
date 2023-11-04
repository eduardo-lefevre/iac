import sys
import unicodedata


def _error(text: str):
    print(text, file=sys.stderr)


def _no_accent(char):
    return unicodedata.normalize('NFD', char).encode('ascii', 'ignore').decode('utf-8')


def _norm(text: str):
    return ''.join(_no_accent(char) if char.isalnum() else '_' for char in text.lower())


def _sorted_quoted(a_list: list):
    return ', '.join(f'"{item}"' for item in sorted(a_list))


def _res_name(*items):
    return _norm('_'.join(items))
