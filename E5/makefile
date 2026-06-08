install:
	sudo apt-get install -f flex
	sudo apt-get install -f bison

compile:
	bison --defines=token.h e5.y
	flex e5.l
	gcc -o verifica main.c e5.tab.c lex.yy.c typecheck.c expr.c decl.c type.c symbol.c hash_table.c 

test:
	./run_tests.sh

clean:
	rm lex.yy.c
	rm e5.tab.c
	rm token.h
	rm verifica

