# Formal-Languages-and-Compilors-Project

## 📄 Project Documentation

📄 [Click here to view the full PDF documentation](https://docs.google.com/document/d/1jDhlf-5knfU9hEsQ_Jcsu0lKwXiIWQpnqrLJ-tqIPVs/edit?usp=sharing)

# TaskLang Compiler

Welcome! This project is a simple easy compiler that understands a small language called **TaskLang**.  
The goal is to let a computer read and understand commands for example, like:

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



# How to Compile and Run
You need to be inside the folder (in WSL or Linux terminal):
```
bison -d parser.y
mv parser.tab.c y.tab.c
mv parser.tab.h y.tab.h
flex lexer.l
gcc -c y.tab.c
gcc -c lex.yy.c
gcc -c task_table.c
gcc -c main.c
gcc -o tasklang y.tab.o lex.yy.o task_table.o main.o -lfl
```

Then run it with:
```
./tasklang < example2.task
```
