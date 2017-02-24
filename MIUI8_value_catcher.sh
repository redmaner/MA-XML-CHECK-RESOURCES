#!/bin/bash

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
