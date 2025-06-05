%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%
"task"              { return TASK; }
"priority"          { return PRIORITY; }
"due"               { return DUE; }
"complete"          { return COMPLETE; }
"delete"            { return DELETE; }
"print"             { return PRINT; }
"all"               { return ALL; }
"pending"           { return PENDING; }
"high"              { return HIGH; }
"medium"            { return MEDIUM; }
"low"               { return LOW; }
";"                 { return SEMICOLON; }
"="                 { return ASSIGN; }
\"([^\\\"]|\\.)*\"  {
    yylval.str = strdup(yytext + 1);
    yylval.str[strlen(yylval.str) - 1] = '\0';
    return STRING;
}
[ \t\n]+            ;
.                   {
    printf("Unknown character: %s\n", yytext);
    exit(1);
}
%%
int yywrap() { return 1; }

