# Formal-Languages-and-Compilors-Project

# TaskLang Compiler

Welcome! This project is a **simple compiler** that understands a small language called **TaskLang**.  
The goal is to let a computer read and understand commands like:

```tasklang
task "Buy milk" priority = high;
complete "Buy milk";
print all;
```

# **What This Project Does**
Adds new tasks with a description, optional priority, and optional due date

Marks tasks as completed

Deletes tasks by name

Prints tasks based on filters:
```
- print all;

- print pending;

- print high;
```


| File            | Description                                                                 |
| --------------- | --------------------------------------------------------------------------- |
| `parser.y`      | The **grammar rules** of TaskLang. Defines how each command is structured.  |
| `lexer.l`       | The **token reader**. Detects keywords like `"task"`, `"print"`, etc.       |
| `main.c`        | Starts the compiler and calls the parser.                                   |
| `task_table.h`  | Describes what a "task" is (structure with description, priority, due date) |
| `task_table.c`  | Handles task logic: add, complete, delete, print.                           |
| `example1.task` | A simple test script.                                                       |
| `example2.task` | A test script that uses `delete`.                                           |
| `Makefile`      | Optional. Used to compile everything with one command.                      |



 **Example Input (example2.task)**
 ```
task "Finish report" priority = medium due = "2025-06-05";
task "Clean room" priority = low;
complete "Clean room";
delete "Finish report";
print all;
```



