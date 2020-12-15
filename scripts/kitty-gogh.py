import json
import requests


#json_color_schemes = requests.get('https://gist.githubusercontent.com/rapgru/09b449285231d18f4e4536c5f48f \
    #c927/raw/5cc7645100f6dd74458d13c8aa0cd50a61a01eb4/windows-terminal-gogh-schemes.json')
color_scheme = 'Flat Remix'

color_schemes = json.loads(open('/home/anupama/.tests/scripts/gogh-colorschemes.json').read())
for color_scheme in color_schemes['schemes']:
    for color_num, (name, color) in enumerate(color_scheme.items()):
        print(color)
        if color == color_scheme:
            print(f'color{color_num} {color_scheme}')
            break 