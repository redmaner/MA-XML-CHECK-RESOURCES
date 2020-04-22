#!/bin/bash

catch_values_arrays () {
cat << EOF
alphabet_chars
BacklightValues
color_mode_ids
default
entryValues
entryvalues
prefValues
Value
value
VibePattern
vibration_torch
EOF
}

catch_values_strings () {
cat << EOF
entryvalue
default
entryValues
prefValues
Value
value
EOF
}
