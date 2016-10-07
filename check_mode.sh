#!/bin/bash

check_basic () {
		max_proces; xml_check_parser &
		max_proces; xml_check_doubles &
		max_proces; xml_check_apostrophe &
		max_proces; xml_check_values &
		max_proces; xml_check_plus &
		max_proces; xml_check_variables &      
        max_proces; xml_check_formatted_false &
} 

check_normal () {
		max_proces; xml_check_parser &
		max_proces; xml_check_doubles &
		max_proces; xml_check_apostrophe &
		max_proces; xml_check_values &
		max_proces; xml_check_plus &
		max_proces; xml_check_variables &
		max_proces; xml_check_formatted_false &
        max_proces; xml_check_untranslateable &
}       

check_fix () {
		max_proces; xml_check_parser &
		max_proces; xml_check_doubles &
		max_proces; xml_check_apostrophe &
		max_proces; xml_check_values &
		max_proces; xml_check_plus &
		max_proces; xml_check_variables &
		max_proces; xml_check_formatted_false &
        max_proces; xml_fix_untranslateable &
        max_proces; xml_check_untranslateable &
}
