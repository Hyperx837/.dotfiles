import sys
import os
import subprocess

if len(sys.argv) < 3:
    print('no enough arguments')
    exit(1)

in_dir = sys.argv[1]
out_dir = f'{sys.argv[1]}-converted'
con_ext = sys.argv[2]

files = os.listdir(in_dir)
os.mkdir(out_dir)

for file in files:
    fname, fext = os.path.splitext(file)
    fpath = f'{in_dir}/{file}'
    subprocess.Popen(['svgexport', fpath, f'/{out_dir}/{fname}.{con_ext}', '1024:1024'])
