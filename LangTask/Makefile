all: tasklang

tasklang: lex.yy.o y.tab.o task_table.o main.o
	$(CC) -o tasklang lex.yy.o y.tab.o task_table.o main.o -lfl

lex.yy.o: lex.yy.c
	$(CC) -c lex.yy.c

y.tab.o: y.tab.c
	$(CC) -c y.tab.c

task_table.o: task_table.c
	$(CC) -c task_table.c

main.o: main.c
	$(CC) -c main.c

y.tab.c y.tab.h: parser.y
	bison -d parser.y

lex.yy.c: lexer.l
	flex lexer.l

clean:
	rm -f *.o lex.yy.c y.tab.c y.tab.h tasklang
