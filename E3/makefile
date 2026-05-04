bison:
	bison --defines=token.h --output=e3.c e3.y

flex:
	flex e3.l

compile:
	gcc -o interpreta  e3.c lex.yy.c main.c

all:
	make bison
	make flex
	make compile

test:
	./run_tests.sh

clean:
	rm lex.yy.c
	rm e3.c
	rm token.h
	rm interpreta

