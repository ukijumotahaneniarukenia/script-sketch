#!/bin/bash

#グルーピング列が周期規則性をもって並んでいることを保証する

#この例だったら、name,domain,age,prefの順で第一列が並んでいることを保証する

#"name"	 " kazumi"
#"domain"	 "gmail.com"
#"age"	 "30"
#"pref"	 "chiba"
#"name"	 "ichirou"
#"domain"	 "yahoo.co.jp"
#"age"	 "18"
#"pref"	 "tokyo"
#"name"	 " yuusuke"
#"domain"	 "hotmail.com"
#"age"	 "25"
#"pref"	 "chiba"
#"name"	 " satoshi"
#"domain"	 "gmail.com"
#"age"	 "45"
#"pref"	 "kanagawa"
#"name"	 "jirou "
#"domain"	 "hotmail.com"
#"age"	 "9"
#"pref"	 "tokyo"

#awkの配列インデックス単位でグルーピング列の値を一意に特徴づける

#ソートキーはグルーピング列の一つ隣の列番号

#ソートし終えたら、グルーピング列のみを取得

#水平展開

#awkの配列要素個数ごとに明細部は行を取得して水平展開する必要があるので、awkで求めた値をbashに持ちわます必要がある

bash-cのところで、seq @を持たせる。リニア処理させるため。

行を蓄積する部分は蓄積用の配列を用意しよう

#ヘッダ部
HEAD_WITH_CNT="$(cat data | cut -d' ' -f1 | awk '{
  for(i=1;i<=NF;i++){
    set[$i]=NR
  }
}END{
  for(i in set){
    print i,set[i];
    cnt++;
  }
  print cnt;
}
' | sort -k2 | cut -d ' ' -f1 | xargs)"

HEAD_CNT=$(echo "${HEAD_WITH_CNT}" | sed -e 's/.*\([0-9]\{1,\} \).*/\1/g')
HEAD_WITHOUT_CNT=$(echo "${HEAD_WITH_CNT}" | sed -e 's;\(^[0-9]\{1,\} \);;')

echo "${HEAD_WITHOUT_CNT}"

#明細部
LN_CNT=0;
SEP=" ";

#自前で実装するとえぐみがあるなpandas使ったほうがよさげや
#各レコードに最大行数をもたせる
cat data | cut -d' ' -f2 | paste - <(cat data | wc -l | xargs -I@ bash -c 'yes @ | head -n@') | while read LN MX_LN_CNT;do\
  if [ $((${MX_LN_CNT}%${HEAD_CNT})) -eq 0 ];then
    echo "${CUM_LN}" | xargs;
    CUM_LN="";
    LN_CNT=0;
  else
    CUM_LN="${CUM_LN}${SEP}${LN}";
    LN_CNT=$(($LN_CNT+1));
  fi
done
