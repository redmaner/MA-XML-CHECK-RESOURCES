#!/bin/bash

up=$PWD
untranslateable_defaults=$up/untranslateable_defaults.log
untranslateable_ignorelist=$up/untranslateable_ignorelist.log
ignorelist_untranslateable=$up/ignorelist_untranslateable.log
miuiv=MIUI9

cat $up/auto_defaults.xml | grep 'item' | while read item; do
	if [ $(cat $up/"$miuiv"_untranslateable.xml | grep "$item" | wc -l) -gt 0 ]; then
		echo "$item"
	fi
done > $untranslateable_defaults

cat $up/"$miuiv"_auto_ignorelist.xml | grep 'item' | while read item; do
	if [ $(cat $up/"$miuiv"_untranslateable.xml | grep "$item" | wc -l) -gt 0 ]; then
		echo "$item"
	fi
done > $untranslateable_ignorelist

cat $up/"$miuiv"_untranslateable.xml | grep 'item' | while read item; do
	if [ $(cat $up/"$miuiv"_auto_ignorelist.xml | grep "$item" | wc -l) -gt 0 ]; then
		echo "$item"
	fi
done > $ignorelist_untranslateable
