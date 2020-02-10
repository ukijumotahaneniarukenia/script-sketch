#!/usr/bin/local/awk

#awk実践入門より
#functionの引数のうち,実引数にマッピングされている仮引数、それ以外を関数内で有効なローカル引数としている。
#わかりやすくタブ２つで話している。右側がローカル引数

function except_common_union_set(except_common_union,self,other,    only_self,only_other){
  #配列の一括削除
  delete(only_self);
  #配列の一括削除
  delete(only_other);
  minus_set(only_other,self,other);
  minus_set(only_self,other,self);
  union_set(except_common_union,only_self,only_other);
  return size_set(except_common_union);
}

function minus_set(minus,self,other,    ele,cnt){
  #配列の一括削除
  delete(minus);
  for(ele in self){
    #自身の配列要素が他方の配列要素に含まれるかチェック
    #含まれていれば、0
    #含まれていなければ、1
    if(!exists_set(other,ele)){
      minus[ele]=1;
    }
  }
  return size_set(minus);
}

function union_set(union,self,other,    ele,cnt){
  #配列の一括削除
  delete(union);
  for(ele in self){
    #自身と自身以外の両方の要素を一つの配列に格納する
    union[ele]=1;
  }
  for(ele in other){
    #自身と自身以外の両方の要素を一つの配列に格納する
    union[ele]=1;
  }
  return size_set(union);
}

function common_set(common,self,other,    ele,cnt){
  #配列の一括削除
  delete(common);
  for(ele in self){
    #自身の配列要素が他方の配列要素に含まれるかチェック
    #含まれていれば、1
    #含まれていなければ、0
    if(exists_set(other,ele)){
      common[ele]=1;
    }
  }
  return size_set(common);
}

function size_set(self,   ele,cnt){
  #引数に受け取った集合を舐め回して、インデックスに紐づく値が1である個数を返却
  for(ele in self){
    if(self[ele]==1){
        cnt++;
    }
  }
  return cnt;
}

function exists_set(self,   ele,cnt){
  #引数に受け取った集合に引数に受け取ったインデックスに紐づく値が1の場合、1を返却
  #引数に受け取った集合に引数に受け取ったインデックスに紐づく値が1でない場合、0を返却
  #配列に格納する際、0以外の値を代入していない。
  if(self[ele]==1){
    return 1;
  }else{
    delete self[ele];
    return 0;
  }
}

function include_set(self,other,    ele){
  #引数で与えられた自身の集合の要素が他方の集合に含まれていない場合は0、いる場合は1。
  for(ele in self){
    if(!exists_set(other,ele)){
      return 0;
    }
    return 1;
  }
}

#awkの真偽判定は0と空文字以外は真なので。
function equal_set(self,other,    ele){
  #引数で与えられた自身の集合の要素が他方の集合に含まれており、かつ他方の集合の要素が自身の集合の要素に含まれている場合は1。それ以外は0。
  if(include_set(self,other) && include_set(other,self)){
    return 1;
  }else{
    return 0;
  }
}

function copy_set(tgt,src,    ele){
  for(ele in src){
    tgt[ele]=1;
  }
}

#引数で受け取った自身の集合を文字列辞書昇順で並び替えたあと、ターゲットの集合にコピー。
#コピーメソッドに元集合と、ソート後の集合を渡して、ソート後の集合で元集合を上書き。
function order_set(self,    tgt,ele){
  PROCINFO["sorted_in"]="@ind_str_asc";
  for(ele in self){
    tgt[ele]=1;
  }
  copy_set(self,tgt);
}
