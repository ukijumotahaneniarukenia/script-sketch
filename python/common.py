#!/usr/local/bin/python3.7

def print_meta_info():
  print("locals:");
  _local=locals();
  print(_local.keys());
  print("globals:");
  _global=globals();
  print(_global.keys());
  
  print("locals minus globals");
  for key in _local.keys() - _global.keys():
    #print(key);
    print({key:_local[key]});
  
  print("globals minus locals");
  for key in _global.keys() - _local.keys():
    #print(key);
    print({key:_global[key]});

print_meta_info();
