#!/bin/bash

echo  {a..e} | xargs -I@ bash -c '
jshell -s <(cat <<EOS
private <T> List<T> cons(T first, List<T> remain) {
    List<T> ret = new ArrayList<>();
    ret.add(first);
    ret.addAll(remain);
    return ret;
}
private void process(List<String> rsv_args,int cnt){
  for(int ind=0;ind<cnt;ind++){
    String ele = rsv_args.remove(0);
    System.out.println(ele);
    System.out.println(rsv_args);
    List<String> liz_done = cons(ele,rsv_args);
    System.out.println(liz_done);
  }
}
private void main(List<String> rsv_args){
  process(rsv_args,rsv_args.size());
}
main(new ArrayList<>(Arrays.asList("@".split(" "))));
/exit
EOS
)
'