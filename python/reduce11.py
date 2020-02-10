#!/usr/local/bin/python3.7

#$seq 10 | xargs -n2 | ./reduce11.py
#,1 2
#,1 2,3 4
#,1 2,3 4,5 6
#,1 2,3 4,5 6,7 8
#,1 2,3 4,5 6,7 8,9 10
#$seq 10 | xargs -n3 | ./reduce11.py
#,1 2 3
#,1 2 3,4 5 6
#,1 2 3,4 5 6,7 8 9
#,1 2 3,4 5 6,7 8 9,10
#$seq 10 | xargs -n4 | ./reduce11.py
#,1 2 3 4
#,1 2 3 4,5 6 7 8
#,1 2 3 4,5 6 7 8,9 10

import sys

def main():
  cum=""
  for ln in sys.stdin:
    cum=cum+"+"+ln.strip()
    print(cum)

if __name__=="__main__":
    main()
