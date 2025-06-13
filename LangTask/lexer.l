%{
#include "y.tab.h"
%}

%%

"task"          { return TASK; }
"complete"      { return COMPLETE; }
"delete"        { return DELETE; }
"print"         { return PRINT; }
"priority"      { return PRIORITY; }
"due"           { return DUE; }
"all"           { return ALL; }
"pending"       { return PENDING; }
"completed"     { return COMPLETED; }
"high"          { return HIGH; }
"medium"        { return MEDIUM; }
"low"           { return LOW; }
"due"           { return DUE_FILTER; }

\"[^\"]*\"      {
                  yylval.str = strdup(yytext + 1);
                  yylval.str[strlen(yylval.str) - 1] = '\0';
                  return STRING;
               }

[ \t\r\n]+      ;
.               { return yytext[0]; }

%%
