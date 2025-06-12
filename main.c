#include <stdio.h>
#include <stdlib.h>
#include "task_table.h"

int yyparse(void);

int main() {
    init_task_table();
    int result = yyparse();
    free_task_table();
    return result;
}
