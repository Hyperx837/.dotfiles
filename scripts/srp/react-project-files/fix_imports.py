from typing import Dict


class Test:
    def __init__(self):
        pass

    def classmeth(self, argument):
        return None


def fix_imports(file: str, repl_lines: Dict[str, str]):
    with open(file) as fp, open(file, 'w') as fp1:
        new_file = '\n'.join(repl_line if origi_line in line else line
                                    for line in fp.read().splitlines()
                                    for origi_line, repl_line in repl_lines.items())
        fp1.write(new_file)
#    for origninal_line in replace_lines.keys():
#        for line in indexjs:
#            if  origninal_line in line:
#                line = replace_line


fix_imports('react-project-files/index.js', {
    'import App from "./App";': 'import App'
    })
