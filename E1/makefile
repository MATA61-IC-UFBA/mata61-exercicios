install:
	sudo apt-get install -f flex

compile:
	cd ./E1
	flex e1.l
	gcc -o e1 lex.yy.c main.c
