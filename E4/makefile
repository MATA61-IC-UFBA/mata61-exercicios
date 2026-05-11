install:
	sudo apt-get install -f flex
	sudo apt-get install -f bison

compile:
	bison --defines=token.h --output=e4.c e4.y
	flex e4.l
	gcc -o valida e4.c lex.yy.c main.c ast.c

test:
	./run_tests.sh

clean:
	rm lex.yy.c
	rm e4.c
	rm token.h
	rm valida

