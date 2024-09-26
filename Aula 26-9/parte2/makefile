# Organizando os arquivos no makefile

# Nome do projeto
PROJ_NAME=calc

L_SOURCE=$(wildcard *.l)

Y_SOURCE=$(wildcard *.y)

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
	./$(PROJ_NAME)



lexico: $(L_SOURCE)
	@ echo 'Construindo analisador léxico'
	flex -o lex.c $(L_SOURCE)
	@ echo 'Analisador léxico pronto!'

sintatico: lexico $(Y_SOURCE)
	@ echo 'Construindo analisador sintático'
	bison -v -d $(Y_SOURCE) -o $(PROJ_NAME).c
	@ echo 'Analisador sintático pronto!'

comp: sintatico
	@ echo 'Compilando o projeto'
	gcc -o $(PROJ_NAME) $(PROJ_NAME).c lex.c
	@ echo 'Projeto compilado!'



clean: 
	@ echo 'Limpando arquivos'
	rm -f $(PROJ_NAME) $(PROJ_NAME).c lex.c $(PROJ_NAME).output $(PROJ_NAME).h
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