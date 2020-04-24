- CMD

```
private static List<String> yyy(String s,String sep){

    //split使えばいい

    List<String> rt = new ArrayList<>();
    int cnt = s.length()-s.replace(sep,"").length()+1;
    for(int i=0;i<cnt;i++){
        s=s.substring(s.indexOf(sep)+1);
        rt.add(s.substring(0,-1==s.indexOf(sep)?s.length():s.indexOf(sep)));
    }
    return rt;
}
```
