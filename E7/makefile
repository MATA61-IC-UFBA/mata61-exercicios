install:
	sudo apt-get install bison

compile:
	bison -d e7.y
	flex e7.l
	cc -o avalia lex.yy.c e7.tab.c ast.c main.c


test:
	./run_tests.sh

all:
	make install
	make compile
	make test

clean: 
	rm e7.tab.*
	rm lex.yy.*


