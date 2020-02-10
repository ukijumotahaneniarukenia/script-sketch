#!/usr/local/bin/python3.7

import termcolor

deco_upper=30;
deco_center=28;
deco_lower=30;

centering_snippet='*{:^'+deco_center+'}'
print(centering_snippet)

# 警告(Warning)
warning = '*' * deco_upper + '\n';
warning += '*{:^'+'28'+'}'+'\n'.format('Warning')
warning += '*' * deco_lower + '\n'
colored_warning = termcolor.colored(warning, 'red')
print(colored_warning)
 
# 黄色(Caution)
caution = '+' * deco_upper + '\n'
caution += '+{:^28}+\n'.format('Caution')
caution += '+' * deco_lower + '\n'
colored_warning = termcolor.colored(caution, 'yellow')
print(colored_warning)
 
# 通知(Notice)
notice = '-' * deco_upper + '\n'
notice += '|{:^28}|\n'.format('Notice')
notice += '-' * deco_lower + '\n'
colored_warning = termcolor.colored(notice, 'green')
print(colored_warning)
