#!/bin/bash
# Script to extract default strings

if [ ! -d $up/trans_repo ]; then
	source $up/repo-transformer.sh
fi

rm -f $up/defaults.xml $up/auto_defaults.xml

catch_values_arrays () {
cat << EOF
value
Value
entryValues
default
entryvalues
prefValues
BacklightValues
alphabet_chars
animation_data
EOF
}

catch_values_strings () {
cat << EOF
entryvalue
Value
value
EOF
}

start_extract () {
case "$XML_TYPE" in
	arrays.xml)
	catch_values_arrays | while read value_entry; do
		cat $XML_TARGET | grep 'name="' | cut -d'"' -f2 | grep "$value_entry" | while read catched_entry; do
			echo '	<item folder="all" application="'$APK'" file="'$XML_TYPE'" name="'$catched_entry'"/>' >> $up/defaults.xml
		done 
	done;;

	strings.xml)
	catch_values_strings | while read value_entry; do
		cat $XML_TARGET | grep 'name="' | cut -d'"' -f2 | grep "$value_entry" | while read catched_entry; do
			echo '	<item folder="all" application="'$APK'" file="'$XML_TYPE'" name="'$catched_entry'"/>' >> $up/defaults.xml
		done 
	done;;
esac
}

extract_def () {
XML_TARGET=$1

if [ -e "$XML_TARGET" ]; then
	XML_TYPE=$(basename $XML_TARGET)

	# Fix .part files for XML_TYPE
	if [ $(echo $XML_TYPE | grep ".part" | wc -l) -gt 0 ]; then
		case "$XML_TYPE" in
		   	strings.xml.part) XML_TYPE="strings.xml";;
			arrays.xml.part) XML_TYPE="arrays.xml";;
			plurals.xml.part) XML_TYPE="plurals.xml";;
		esac
	fi

	start_extract
fi
}

for apk_target in $(find $up/trans_repo -iname "*.apk" | sort); do
	APK=$(basename $apk_target)
	DIR=$(basename $(dirname $apk_target))
	for xml_target in $(find $apk_target -iname "arrays.xml*" -o -iname "strings.xml*" -o -iname "plurals.xml*"); do
		extract_def "$xml_target" 
	done
done

echo -e ">>> extracting defaults"
cat > $up/auto_defaults.xml << EOF
<?xml version="1.0"?>
<!-- 	All string/array/plural names in this file should not be marked as untranslateable.

	This file uses a specific format
	- First the application name: This must be the exact same name as the application in the language repository
	- Second the file type
	- Third the actual name of the string
	This format prevents that strings get mixed up and will spare time while doing the initial check.

	Please keep the applications and file types in alfabetical order, to keep the overview. -->
<resources>
EOF
cat $up/defaults.xml >> $up/auto_defaults.xml
echo "</resources>" >> $up/auto_defaults.xml

