//http://iyukki.blog56.fc2.com/blog-entry-148.html
#include <stdio.h>
void main(){
  for(int i=1;i<100;i++){
    if(printf((i%3==0)?"Fizz":"")+
       printf((i%5==0)?"Buzz":"")==0){
       printf("%d",i);
    }   
    printf("\n");
  }
}