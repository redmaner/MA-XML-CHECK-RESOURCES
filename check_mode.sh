#!/bin/bash

# modes for the check= parameter in languages.xml
check_basic () {
		max_proces; xml_check_parser &
		max_proces; xml_check_doubles &
		max_proces; xml_check_apostrophe &
		max_proces; xml_check_values &
		max_proces; xml_check_plus &
		max_proces; xml_check_variables &      
        max_proces; xml_check_formatted_false &
} 

check_all () {
		max_proces; xml_check_parser &
		max_proces; xml_check_doubles &
		max_proces; xml_check_apostrophe &
		max_proces; xml_check_values &
		max_proces; xml_check_plus &
		max_proces; xml_check_variables &
		max_proces; xml_check_formatted_false &
        max_proces; xml_check_untranslateable &
}     

check_all_fix () {
		max_proces; xml_check_parser &
		max_proces; xml_check_apostrophe &
		max_proces; xml_check_values &
		max_proces; xml_check_plus &
		max_proces; xml_check_variables &
		max_proces; xml_check_formatted_false &
}       
  

# modes for the fix= parameter in languages.xml
fix_untranslateable () {
        max_proces; xml_fix_untranslateable &
}

fix_all () {
        max_proces; xml_fix_double &
        max_proces; xml_fix_untranslateable &
}
