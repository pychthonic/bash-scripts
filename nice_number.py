# Python version of Script # 4 in "Wicked Cool Scripts" by
# Dave Taylor and Brandon Perry
# It takes a number and prints out a human-readable number
# with a thousands-delimiter (',' every three digits by
# default) and a decimal-delimiter ('.' by default).

import sys

arguments = sys.argv

if '-t' in arguments:
    thousands_delimiter = arguments[arguments.index('-t') + 1]
else:
    thousands_delimiter = ','

if '-d' in arguments:
    decimal_delimiter = arguments[arguments.index('-d') + 1]
else:
    decimal_delimiter = '.'

number_str = arguments[-1]

if decimal_delimiter in number_str:
    integer_part = number_str[:number_str.index(decimal_delimiter)]
    decimal_part = number_str[number_str.index(decimal_delimiter):]
else:
    integer_part = number_str
    decimal_part = ""

def add_thousands_delimiter(number_string):
    reversed_number_string = number_string[::-1]
    nice_looking_number = thousands_delimiter.join(
            [reversed_number_string[j:j+3] for j in range(
                0, len(reversed_number_string), 3)])[::-1]
    return nice_looking_number

integer_part = add_thousands_delimiter(integer_part)

print(integer_part + decimal_part)
