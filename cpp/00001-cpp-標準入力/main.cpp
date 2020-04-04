#include <iostream>
#include <sstream>
#include <vector>

using namespace std;

int main(int argc, char **argv) {
  if(1==argc){
    //パイプ経由引数の場合
    vector<string> args;
    string row,col;
    int i,j=0;
    while(getline(cin,row)){
      i++;
      stringstream instream(row);
      cout <<row<<endl;
      cout <<i<<endl;
      while(getline(instream,col,' ')){
        j++;
        cout <<col<<endl;
        cout <<j<<endl;
      }
    }

    //for(string e:args){
    //  cout <<e<<endl;
    //}
  }else{
    //コマンドライン経由引数の場合
    vector<string> args(argv+1,argv+argc); // ポインタ開始位置+1して実行ファイル名以降をベクタに格納
    for(string e:args){
      cout <<e<<endl;
    }
  }
  return 0;
}
