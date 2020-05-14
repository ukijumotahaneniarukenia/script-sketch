#include <iostream>
#include <sqlite3.h>

int main(){
  sqlite3 *db;
  if (sqlite3_open("testdb", &db) == SQLITE_OK){
      std::cout << "Opened db successfully" <<std::endl;
  }else{
      std::cout << "Failed to open db" <<std::endl;
  }
  return 0;
}
