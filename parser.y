%{
#include <stdio.h>
#include <string.h>
#include "task_table.h"
extern int yylex();
void yyerror(const char *s) { fprintf(stderr, "Parse error: %s\n", s); }
%}

%union {
    char *str;
}

%token <str> STRING
%token TASK COMPLETE DELETE PRINT PRIORITY DUE ALL PENDING HIGH MEDIUM LOW COMPLETED DUE_FILTER
%type <str> filter
%type <str> optional_priority optional_due

%%
program:
    program statement
    |
    ;

statement:
    TASK STRING optional_parts ';'       { insert_task($2, $3, $4); }
  | COMPLETE STRING ';'                  { complete_task($2); }
  | DELETE STRING ';'                    { delete_task($2); }
  | PRINT filter ';'                     { print_tasks($2); }
  ;

optional_parts:
    optional_priority optional_due       { $$ = $1; $$ = $2; }
  | optional_due optional_priority       { $$ = $2; $$ = $1; }
  | optional_priority                    { $$ = $1; $$ = NULL; }
  | optional_due                         { $$ = NULL; $$ = $1; }
  |                                      { $$ = NULL; $$ = NULL; }
  ;

optional_priority:
    PRIORITY '=' STRING                  { $$ = $3; }
  ;

optional_due:
    DUE '=' STRING                       { $$ = $3; }
  ;

filter:
    ALL                                  { $$ = "all"; }
  | PENDING                              { $$ = "pending"; }
  | COMPLETED                            { $$ = "completed"; }
  | HIGH                                 { $$ = "high"; }
  | MEDIUM                               { $$ = "medium"; }
  | LOW                                  { $$ = "low"; }
  | DUE_FILTER STRING                    { $$ = $2; }
  ;
%%
