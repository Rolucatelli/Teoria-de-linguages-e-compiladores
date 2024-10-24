# Organizando os arquivos no makefile

# Nome do projeto
PROJ_NAME=CompSimple

PROG=helloWorld

LEXICO=$(wildcard ./Compilador/*.l)

SINTATICO=$(wildcard ./Compilador/*.y)


# # Nome do arquivo de Debug
# DEBUG_NAME=escDebug

# # Arquivos .c
# C_SOURCE=$(wildcard ./src/*.c)

# # Arquivos .h
# H_SOURCE=$(wildcard ./hdr/*.h)

# # Arquivos objeto
# OBJ=$(subst .c,.o,$(subst src,objects,$(C_SOURCE) ./objects/main.c))

# # Compilador
# CC=gcc

# # Flags (opções) para o compilador
# CC_FLAGS=-c -W -Wall -pedantic

# # Comando utilizado como target do clean
# RM = rm -rf

#########################
# Compilação e linkagem #
#########################
all: comp
run: comp
	./$(PROJ_NAME) ./Codigos/$(PROG).simples



lexico: $(LEXICO)
	@ echo 'Construindo analisador léxico'
	flex -o ./Compilador/Objects/lex.c $(LEXICO)
	@ echo 'Analisador léxico pronto!'

sintatico: lexico $(SINTATICO)
	@ echo 'Construindo analisador sintático'
	bison -v -d $(SINTATICO) -o ./Compilador/Objects/sintatico.c
	@ echo 'Analisador sintático pronto!'

comp: sintatico
	@ echo 'Compilando o projeto'
	gcc -o $(PROJ_NAME) ./Compilador/Objects/sintatico.c
	@ echo 'Projeto compilado!'



clean: 
	@ echo 'Limpando arquivos'
	rm -f $(PROJ_NAME) ./Compilador/Objects/*
	@ echo 'Arquivos limpos!'


# all: objFolder exeFolder $(PROJ_NAME)
# debug: objFolder exeFolder $(DEBUG_NAME)
# run:
# 	@ ./exe/escalonador

# $(DEBUG_NAME): $(OBJ)
# 	@ echo 'Construindo arquivo de Debug usando o linker GCC: $@'
# 	$(CC) $^ -o ./exe/$@ -g
# 	@ echo 'Arquivo de Debug pronto!: $@'
# 	@ echo ' '

# $(PROJ_NAME): $(OBJ)
# 	@ echo 'Construindo o binário usando o linker GCC: $@'
# 	$(CC) $^ -o ./exe/$@
# 	@ echo 'Binário pronto!: $@'
# 	@ echo ' '

# ./objects/%.o: ./src/%.c ./hdr/%.h
# 	@ echo 'Construindo target usando o compilador GCC: $<'
# 	$(CC) $< $(CC_FLAGS) -o $@
# 	@ echo ' '

# ./objects/main.o: ./main/main.c $(H_SOURCE)
# 	@ echo 'Construindo target usando o compilador GCC: $<'
# 	$(CC) $< $(CC_FLAGS) -o $@
# 	@ echo ' '

# objFolder:
# 	@ mkdir -p objects

# exeFolder:
# 	@ mkdir -p exe ./exe/logs

# clean:
# 	@ $(RM) ./objects/*.o ./exe/* *~
# 	@ rmdir objects exe

# .PHONY: all clean
# Se existir algum arquivo com o mesmo nome que uma tag, como clean.c ou all.c, ele ignora