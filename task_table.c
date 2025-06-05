#include "task_table.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TASKS 100

typedef struct {
    char *desc;
    char *priority;
    char *due;
    int completed;
} Task;

Task tasks[MAX_TASKS];
int task_count = 0;

void init_task_table() {
    task_count = 0;
}

void insert_task(char *desc, char *priority, char *due) {
    tasks[task_count].desc = strdup(desc);
    tasks[task_count].priority = priority ? strdup(priority) : NULL;
    tasks[task_count].due = due ? strdup(due) : NULL;
    tasks[task_count].completed = 0;
    printf("Task added: %s\n", desc);
    task_count++;
}

void complete_task(char *desc) {
    for (int i = 0; i < task_count; i++) {
        if (strcmp(tasks[i].desc, desc) == 0) {
            tasks[i].completed = 1;
            printf("Task completed: %s\n", desc);
            return;
        }
    }
    printf("Task not found: %s\n", desc);
}

void delete_task(char *desc) {
    for (int i = 0; i < task_count; i++) {
        if (strcmp(tasks[i].desc, desc) == 0) {
            free(tasks[i].desc);
            if (tasks[i].priority) free(tasks[i].priority);
            if (tasks[i].due) free(tasks[i].due);
            for (int j = i; j < task_count - 1; j++) {
                tasks[j] = tasks[j + 1];
            }
            task_count--;
            printf("Task deleted: %s\n", desc);
            return;
        }
    }
    printf("Task not found: %s\n", desc);
}

void print_tasks(const char *filter) {
    printf("--- Tasks (%s) ---\n", filter);
    for (int i = 0; i < task_count; i++) {
        if ((strcmp(filter, "all") == 0) ||
            (strcmp(filter, "pending") == 0 && !tasks[i].completed) ||
            (strcmp(filter, "high") == 0 && tasks[i].priority && strcmp(tasks[i].priority, "high") == 0)) {

            printf("- %s [%s] %s %s\n",
                   tasks[i].desc,
                   tasks[i].completed ? "done" : "todo",
                   tasks[i].priority ? tasks[i].priority : "",
                   tasks[i].due ? tasks[i].due : "");
        }
    }
}
