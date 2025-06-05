%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "task_table.h"
extern int yylex();

%}

%union {
    char* str;
}

%token <str> STRING
%token TASK PRIORITY DUE COMPLETE PRINT DELETE ALL PENDING HIGH MEDIUM LOW ASSIGN SEMICOLON
%type <str> priority_opt due_opt

%%
program:
      program stmt
    | /* empty */
    ;

stmt:
      task_decl SEMICOLON
    | task_complete SEMICOLON
    | task_delete SEMICOLON
    | task_print SEMICOLON
    ;

task_decl:
      TASK STRING priority_opt due_opt { insert_task($2, $3, $4); }
    ;

priority_opt:
      PRIORITY ASSIGN HIGH    { $$ = "high"; }
    | PRIORITY ASSIGN MEDIUM  { $$ = "medium"; }
    | PRIORITY ASSIGN LOW     { $$ = "low"; }
    | /* empty */             { $$ = NULL; }
    ;

due_opt:
      DUE ASSIGN STRING        { $$ = $3; }
    | /* empty */             { $$ = NULL; }
    ;

task_complete:
      COMPLETE STRING { complete_task($2); }
    ;

task_delete:
      DELETE STRING { delete_task($2); }
    ;

task_print:
      PRINT ALL      { print_tasks("all"); }
    | PRINT PENDING  { print_tasks("pending"); }
    | PRINT HIGH     { print_tasks("high"); }
    ;

%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
