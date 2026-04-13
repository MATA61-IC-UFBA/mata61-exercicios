bison:
	bison --defines=token.h --output=e2.c e2.y

flex:
	flex e2.l

compile:
	gcc -o e2 e2.c lex.yy.c main.c

all:
	make bison
	make flex
	make compile

clean:
	rm lex.yy.c
	rm e2.c
	rm e2

