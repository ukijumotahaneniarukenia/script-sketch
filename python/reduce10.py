#!/usr/local/bin/python3.7

#https://gist.github.com/awagner83/2399967

def main():
  print('this is main')
  #rt=sum([10,1])
  rt=sum(["10","1","2","3","4"])
  print(rt)
  return rt

def sum(nums):
  print(nums)
  print(type(nums))
  rt=''
  for x in nums:
      #print(x)
      #print(type(x))
      #print(rt)
      #print(type(rt))
      rt = rt + "," + x
      print(rt)
      #print(type(rt))
  return rt

if __name__ == '__main__':
  print('start')
  rt=main()
  print('end')
  print(rt)
