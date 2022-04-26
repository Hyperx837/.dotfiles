#!/usr/bin/sh

# this project uses eslint config of airbnb and prettier with some config
# if you don't like it's totally up to you to to configure this to 
# suit your needs. this is the config that I like. since this is
# a simple bash script you can totally configure it to suit you.
# you can replace the global with you own ones, add some other config files,
# remove docker if you dont use it, it's totally up to you


project=$1 # set the project varible to the first cli argument

green="\033[1;32m"
underlined_blue="\033[4;34m"
yellow="\033[0;33m"
nocolor="\033[0m"

print_and_run_command () {                                                     
    printf "${green}❯ ${underlined_blue}$1${yellow} $(echo $* | cut -f 2- -d " ")${nocolor}\n"
    $*
}

create_github_repo () {
    if gh > /dev/null; then
        print_and_run_command gh repo create
    fi

}
print_and_run_command npx create-react-app $project --typescript #  create react app named project
print_and_run_command cd $project # cd into project
print_and_run_command cp -r $HOME/.srp/react-project-files/* ./ # copy global config files into the current directory
print_and_run_command docker-compose up -d # bring up the docker container without blocking the main thread but show the output of it
# print_and_run_command mv fix_imports.py src
print_and_run_command code .  # open up vscode
print_and_run_command cd src # cd into src
print_and_run_command rm App.test.js logo.svg setupTests.js  # remove unwanted files
print_and_run_command mkdir components scss # make two dirs with following names
print_and_run_command mv index.js index.jsx # rename index.js to index.jsx
print_and_run_command mv App.js components/App.jsx # move app.js to components and rename it
print_and_run_command mv index.css scss/App.scss # move index.css to scss/App.scss
print_and_run_command cat App.css >> scss/App.scss # add the  content of App.css to the end of App.scss (joining App.css and index.css)
# print_and_run_command python fix_imports.py & # since locations of files has changed fix the imports with a python script
print_and_run_command cd ..  # go back to root of the workspace
# since we only need yarn start from now delete the othe commands
print_and_run_command echo "yarn start" > docker-entrypoint.sh 

print_and_run_command rm src/App.css fix_imports.py
print_and_run_command git status -s
print_and_run_command git add . 
print_and_run_command git commit -m initial\ commit\ 🚀

create_github_repo
print_and_run_command docker attach "${project}_react-app_1"
# if you have multiple containers or prefer docker compose uncomment below line 
# print_and_run_command docker-compose up
exit 0
