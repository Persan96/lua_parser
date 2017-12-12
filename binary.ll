%top{
#include "binary.tab.hh"
#define YY_DECL yy::parser::symbol_type yylex()
}
%option noyywrap nounput batch noinput
%%
([^\n;$"'| \t]*(\\[;| \\])?)* { return yy::parser::make_TEXT(yytext); }
[\n] { return yy::parser::make_NEWLINE(yytext); }
[|] { return yy::parser::make_PIPE(yytext); }
[;] { return yy::parser::make_SEMICOLON(yytext); }
(['][^']+[']) { return yy::parser::make_QUOTE(yytext); }
(["][^"$]+["]) { return yy::parser::make_DBQUOTE(yytext); }
([$][a-zA-Z]+) { return yy::parser::make_DOLLAR(yytext); }
[ \t]+ { return yy::parser::make_WHITESPACE(yytext); }
<<EOF>> return yy::parser::make_END();
%%
