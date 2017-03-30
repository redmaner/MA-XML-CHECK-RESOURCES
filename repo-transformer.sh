#!/bin/bash
# Script to transform a xiaomi.eu repo into a language repo

rm -rf $up/$NEW_DIR
if [ ! -d $up/$NEW_DIR ]; then
	mkdir -p $up/$NEW_DIR/$LANG_NAME/main
fi

echo -e "\n>>> grabbing lang"
if [ ! -d $up/CHECK_REPO ]; then
	git clone $CHECK_REPO -b $CHECK_REPO_BRANCH CHECK_REPO
else
	cd $up/CHECK_REPO
	git pull origin $CHECK_REPO_BRANCH
	cd $up
fi

echo -e "\n>>> starting copy"
cp -r $up/CHECK_REPO/$CHECK_REPO_DEVICE/* $up/$NEW_DIR/$LANG_NAME/main

echo -e ">>> tranforming"
find $up/$NEW_DIR/$LANG_NAME/main -iname "*.apk" | sort | while read apk; do
	mv $apk/res/values $apk/res/values$LANG_ISO
done


