#include <iostream>
#include "binary.tab.hh"
extern std::string total;

void yy::parser::error(std::string const&err)
 {
   std::cout << "\nWe've failed, better luck next time... " << err << std::endl;
 }

 int main(int argc, char **argv)
 {
   yy::parser parser; if(!parser.parse()) std::cout << "" << total << std::endl; return 0;
 }
