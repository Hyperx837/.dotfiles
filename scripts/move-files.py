#!/usr/bin/python

import subprocess
import shutil
import os

drive = 'drv2'
home_dir = '/home/anupama'
location = f'{home_dir}/Downloads/'
folder = f'{home_dir}/drives/{drive}/'
sub_dirs = os.listdir(folder)
sub_dirs = ['', '', '', '', '']

for sub_dir in sub_dirs:
    shutil.copytree(folder + sub_dir, location + sub_dir)
    print(sub_dir)
