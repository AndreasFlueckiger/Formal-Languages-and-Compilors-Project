# Progetto su Linguaggi Formali e Compilatori

  

🇮🇹 Italiano | 🇬🇧 [Read the English version](README.md)

  

## Documentazione del Progetto

[Clicca qui per visualizzare la documentazione completa]([https://docs.google.com/document/d/1jDhlf-5knfU9hEsQ_Jcsu0lKwXiIWQpnqrLJ-tqIPVs/edit?usp=sharing](https://docs.google.com/document/d/1jDhlf-5knfU9hEsQ_Jcsu0lKwXiIWQpnqrLJ-tqIPVs/edit?usp=sharing))

# Compilatore TaskLang

Benvenuto! Questo progetto è un semplice compilatore che interpreta un linguaggio chiamato **TaskLang**.  

L'obiettivo è permettere al computer di comprendere comandi come:

```tasklang

task "Compra il latte" priority = high;

complete "Compra il latte";

print all;

```


# **Cosa fa questo progetto**

- Aggiunge nuovi task con descrizione, priorità (opzionale) e scadenza (opzionale)

- Segna i task come completati

- Elimina i task in base al nome

- Stampa i task in base a determinati filtri:

```
- print all;
- print pending;
- print high;

```


| File            | Descrizione                                                                     |
| --------------- | ------------------------------------------------------------------------------- |
| `parser.y`      | Le **regole grammaticali** di TaskLang. Definisce la struttura dei comandi.     |
| `lexer.l`       | Il **lettore di token**. Riconosce parole chiave come `"task"`, `"print"`, ecc. |
| `main.c`        | Avvia il compilatore e chiama il parser.                                        |
| `task_table.h`  | Definisce cos'è un "task" (struttura con descrizione, priorità, scadenza).      |
| `task_table.c`  | Gestisce la logica dei task: aggiunta, completamento, eliminazione, stampa.     |
| `example1.task` | Script di test semplice.                                                        |
| `example2.task` | Script di test che usa `delete`.                                                |
| `Makefile`      | Facoltativo. Serve per compilare tutto con un solo comando.                     |
|                 |                                                                                 |


  

**Esempio di input (example2.task)**

```

task "Finisci il report" priority = medium due = "2025-06-05";

task "Pulisci la stanza" priority = low;

complete "Pulisci la stanza";

delete "Finisci il report";

print all;

```

  

# Come compilare ed eseguire

Assicurati di essere nella cartella corretta (in WSL o terminale Linux, ho usato Ubuntu):

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

  

Poi eseguilo con:

```
./tasklang < example2.task
```