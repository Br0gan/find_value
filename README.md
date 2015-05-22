# find_value
PL/SQL Function to return a specific value from a delimitated string.

## example

find_value(string, delimater, iteration) returns varchar

string = 'here|are||some|seperated|values';

find_value(string, '|', 4)

returns 'some'

find_value(string, '|', 3) 

returns NULL

find_value(string, '|', 9)

returns 'NA'


