#include <iostream>
#include <mecab.h>

using namespace std;

int main(int argc,char **argv){
  char input[1024]="波乗りジョニー";

  MeCab::Tagger *tagger = MeCab::createTagger("");

  const char *result = tagger->parse(input);

  cout<<result<<endl;

  delete tagger;

  return 0;
}
