#!/usr/local/bin/python3.7
import sys
#https://note.nkmk.me/python-unicode-escape/
#https://qiita.com/motoki1990/items/d06fc7559546a8471392
#https://qiita.com/masakielastic/items/2a04aee632c62536f82c
stdin=sys.argv[1:]

init_args=list(map(lambda x:x.encode().decode('unicode-escape'),stdin))

def left_stair(rsv_args):
    for ind in range(len(rsv_args)):
        ele=rsv_args[0]
        del rsv_args[0]
        rsv_args.append(ele)
        print(rsv_args)

left_stair(init_args)

def right_stair(rsv_args):
    for ind in range(len(rsv_args)):
        ele=rsv_args[len(rsv_args)-1]
        del rsv_args[len(rsv_args)-1]
        rsv_args.insert(0,ele)
        print(rsv_args)

right_stair(init_args)

#print(list(map(lambda x:x.encode().decode('unicode-escape'),stdin)))
