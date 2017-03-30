#!/bin/bash

CHECK_REPO="git@github.com:Acid-miuipolskapl/v8-XML-Compare.git"
CHECK_REPO_BRANCH="master"
CHECK_REPO_DEVICE="gemini"
NEW_DIR=trans_repo
LANG_NAME=default
LANG_ISO=-def

up=$1
cd $up

source $up/extract-defaults.sh

git add auto_defaults.xml
git commit -m "Update auto defaults"
git push origin master 
