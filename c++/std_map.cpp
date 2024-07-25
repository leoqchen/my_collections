#include <stdio.h>
#include <map>
#include <string>

static std::map<int, std::string> map;

static void insertIfNotExist( int n, std::string s )
{
  auto pair = map.try_emplace( n, s );
  if( pair.second )
    printf("insert: %d, %s\n", n, s.c_str());
  else
    printf("ignore insert: %d, %s\n", n, s.c_str());
}

// g++ -std=c++2a or -std=c++17 -Wall 1.cpp
int main()
{
  insertIfNotExist( 0, "0hello" );
  insertIfNotExist( 0, "0hello" );
  insertIfNotExist( 1, "1hello" );
  insertIfNotExist( 1, "1hello" );


  return 0;
}
