//http://iyukki.blog56.fc2.com/blog-entry-148.html
//http://iyukki.blog56.fc2.com/blog-entry-148.html
#include <stdio.h>
void main(){
  int i;
  for(i=1;i<100;i++){
    if(i%15==0){
      printf("FizzBuzz");
    }else if(i%3==0){
      printf("Fizz");
    }else if(i%5==0){
      printf("Buzz");
    }else{
      printf("%d",i);
    }
    printf("\n");
  }
}