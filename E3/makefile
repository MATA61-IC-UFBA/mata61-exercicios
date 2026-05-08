install:
	sudo apt-get install -f flex
	sudo apt-get install -f bison

compile:
	bison --defines=token.h --output=e3.c e3.y
	flex e3.l
	gcc -o interpreta  e3.c lex.yy.c main.c

test:
	./run_tests.sh

clean:
	rm lex.yy.c
	rm e3.c
	rm token.h
	rm interpreta

