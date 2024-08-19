install:
	sudo apt-get install -f flex
	sudo apt-get install bison

compile:
	bison -d e6.y
	flex e6.l
	cc -o interpreta lex.yy.c e6.tab.c main.c

test:
	./run_tests.sh

all:
	make install
	make compile
	make test

