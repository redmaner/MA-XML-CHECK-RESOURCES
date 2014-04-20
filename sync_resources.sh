#!/bin/bash
# Copyright (c) 2014, Redmaner
# This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International license
# The license can be found at http://creativecommons.org/licenses/by-nc-sa/4.0/

# Define bash colors for Mac OSX / Linux
case `uname -s` in
    Darwin) 
           txtrst='\033[0m' # Color off
           txtred='\033[0;31m' # Red
           txtgrn='\033[0;32m' # Green
           txtblu='\033[0;34m' # Blue
           ;;
    *)
           txtrst='\e[0m' # Color off
           txtred='\e[1;31m' # Red
           txtgrn='\e[1;32m' # Green
           txtblu='\e[1;36m' # Blue
           ;;
esac

RES_BRANCH=$1

# Determine server or a local machine
if [ -d /home/translators.xiaomi.eu ]; then
     	MAIN_DIR=/home/translators.xiaomi.eu/scripts/resources
else
     	MAIN_DIR=$PWD/resources
fi

# Pull MIUI-XML-DEV repository, MIUIv6 branch
echo -e "${txtblu}\nSyncing MIUI-XML-DEV, MIUIv6${txtrst}"
if [ -d $MAIN_DIR/MIUIv6-XML-DEV ]; then
	cd $MAIN_DIR/MIUIv6-XML-DEV
	git pull origin MIUIv6
	cd $MAIN_DIR
else
	git clone git@github.com:Redmaner/MIUI-XML-DEV.git -b MIUIv6 $MAIN_DIR/MIUIv6-XML-DEV
fi

# Pull MIUI-XML-DEV repository, MIUIv5 branch
echo -e "${txtblu}\nSyncing MIUI-XML-DEV, MIUIv5${txtrst}"
if [ -d $MAIN_DIR/MIUIv5-XML-DEV ]; then
	cd $MAIN_DIR/MIUIv5-XML-DEV
	git pull origin MIUIv5
	cd $MAIN_DIR
else
	git clone git@github.com:Redmaner/MIUI-XML-DEV.git -b MIUIv5 $MAIN_DIR/MIUIv5-XML-DEV
fi

source $MAIN_DIR/array_tools.sh
arrays_count_items_directory $MAIN_DIR/MIUIv6-XML-DEV/Dev/main MIUIv6_arrays_items.list
arrays_count_items_directory $MAIN_DIR/MIUIv5-XML-DEV/Dev/main MIUIv5_arrays_items.list

echo -e "${txtblu}\nPushing changes${txtrst}"
git add MIUIv6_arrays_items.list MIUIv5_arrays_items.list
git commit -m "MA-XML-CHECK: Update array items"
git push origin $RES_BRANCH
