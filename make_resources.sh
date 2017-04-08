#!/bin/bash

CHECK_REPO="git@github.com:Acid-miuipolskapl/v8-XML-Compare.git"
CHECK_REPO_BRANCH="master"
CHECK_REPO_DEVICE="gemini"
NEW_DIR=trans_repo
LANG_NAME=default
LANG_ISO=-def

up=$1
cd $up

echo -e "\n>>> grabbing lang"
if [ ! -d $up/CHECK_REPO ]; then
	git clone $CHECK_REPO -b $CHECK_REPO_BRANCH CHECK_REPO
else
	cd $up/CHECK_REPO
	git pull origin $CHECK_REPO_BRANCH
	cd $up
fi

rm -f $up/defaults.xml $up/auto_defaults.xml

if [ -f $up/CHECK_REPO/last_commit ]; then
	if [ $(cat $up/CHECK_REPO/last_commit) != $(cat $up/CHECK_REPO/.git/refs/heads/master) ]; then
		cp $up/CHECK_REPO/.git/refs/heads/master $up/CHECK_REPO/last_commit
		source $up/extract-defaults.sh
		git add auto_defaults.xml
		git commit -m "Update auto defaults"
		git push origin master
	else
		echo ">>> repo not changed, skip default generation"
	fi
else
	cp $up/CHECK_REPO/.git/refs/heads/master $up/CHECK_REPO/last_commit
	source $up/extract-defaults.sh
	git add auto_defaults.xml
	git commit -m "Update auto defaults"
	git push origin master 
fi
