#ifndef TASK_TABLE_H
#define TASK_TABLE_H

void init_task_table();
void insert_task(char *desc, char *priority, char *due);
void complete_task(char *desc);
void delete_task(char *desc);
void print_tasks(const char *filter);

#endif
