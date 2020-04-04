#include <iostream>
#include <sstream>
#include <vector>
#include <unordered_map>

using namespace std;

void debug_map(unordered_map<int,vector<string>> maz){
  for(int i=1;i<maz.size()+1;i++){
    for(string e:maz[i]){
      cout <<e;
    }
    cout <<'\n';
  }
}

void debug_list(vector<string> liz){
  for(string e:liz){
    cout << e << endl;
  }
}

int main(int argc, char **argv) {
  unordered_map<int,vector<string>> maz;
  if(1==argc){
    //パイプ経由引数の場合
    string row,col;
    int i=0;
    while(getline(cin,row)){ //一行ずつrowに代入
      i++;
      vector<string> liz;
      stringstream instream(row);
      while(getline(instream,col,' ')){ //split
        liz.push_back(col);
      }
      maz[i]=liz;
    }
    debug_map(maz);
  }else{
    //コマンドライン経由引数の場合
    vector<string> liz(argv+1,argv+argc); // ポインタ開始位置+1して実行ファイル名以降をベクタに格納 一括代入
    if(1==liz.size()){
      //改行込みでワンエレメントになっている標準入力への対応
      string row,col;
      int i=0;
      stringstream instream(liz[0]);
      while(getline(instream,row,'\n')){ //split
        i++;
        liz={}; //初期化し直し
        stringstream instream(row);
        while(getline(instream,col,' ')){ //split
          liz.push_back(col);
        }
        maz[i]=liz;
      }
      debug_map(maz);
    }else{
      //フラットなコマンドライン引数の場合
      debug_list(liz);
    }
  }
  return 0;
}
