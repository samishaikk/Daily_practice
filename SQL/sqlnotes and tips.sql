/* SET OPERATORS */

union all -> return all rows from both queries, including duplicates 

use union all for faster performance and to find duplicates and quality issues


except 

-> returns unique rows in 1st table that are not found in 2nd table

-> Only one where order of queries affects the final result

-> Uses 2nd table only as lookup 

EXCEPT operator -> can be used to compare table to detect discrepancies between databases


intersect

-> returns common rows between two tables 


combine similar information before analyzing the data 

BEST PRACTICE -> List only the needed columns 

 
/* SET OPERATORS */

types -> union, unionall, except, intersect
rules -> same no.of columns, datatypes, order of columns,
      ->1st query controls columns names

USECASES -> combine information, data detection (except), data completeness check (except)


/* FUNCTIONS */

A built-in SQL code: 
accepts an input value,processes it,returns an output value

single row functions, multi row functions, nested functions

single row functions -> string, numeric, data&time, null

multi row functions -> aggregate(basics), window(advanced)



string functions -> manipulation -> concat, upper, lower, trim, replace
                    calculation -> len
                    string extraction -> left, right ,substring

concat -> literally means combining

trim -> removes the space, gives the len of string

replace -> removes specific character with a new character

remove dashes (-) from a number

select '123-456-789' as phone, replace('123-456-789','-','') as clean_phone

select 'report.txt' as old_filename, replace('report.txt','.txt','.csv') as new_filename

extract -> left and right, left extracts from the left siden and right from the right side 
