#!/bin/bash

flex -o lex.c calc.l
bison -v -d calc.y -o calc.c
gcc lex.c calc.c -o calc
