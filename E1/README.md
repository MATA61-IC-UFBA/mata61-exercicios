# Exercício E1:  Aquecimento com Flex

- Ler o capítulo 1 do livro flex & bison.

## Entrega

Arquivos flex:
+ mywc.l - ver item (I)
+ mywc-linux.l - ver item (II)

Saídas:
+ mywc.output
+ wc.output
+ mywc-linux.output

## Roteiro da atividade

(I) mywc (atenção: não é um analisador léxico!)

1. Implemente o "Example 1-1. Word count fb1-1.l" (página 3, livro do Levine). 
O código-fonte deve ser colocado em um arquivo chamado de mywc.l. Use o template 
fornecido;
2. Rode o Flex (sem diretivas), gerando o arquivo lex.yy.c;
3. Compile o arquivo lex.yy.c e gere um executável chamado de "mywc";
4. Mostre a saída para a) no arquivo mywc.output e a saída para b) no arquivo wc.output:
   - a) Teste seu programa mywc, usando como entrada o arquivo README.md;
```./mywc README.md```

   - b) `Rode o ```wc``` do linux, usando como entrada o arquivo README.md;
```wc README.md```

As saídas wc.output e mywc.output não devem ser iguais (ver explicação no livro de Levine).

(II) mywc-linux

1. Copie mywc.l para mywc-linux.l e modifique mywc-linux.l para que a saída gerada seja igual a saída do wc do linux.
2. Rode o Flex (sem diretivas), gerando o arquivo lex.yy.c;
3. Compile o arquivo lex.yy.c e gere um executável chamado de "mywc-linux";
4. Mostre a saída para c) no arquivo mywc-linux.output. Agora as saídas devem estar iguais.
   - c) Teste seu programa mywc-linux, usando como entrada o arquivo README.md;
```./mywc-linux README.md```

As saídas wc.output e mywc-linux.output devem estar iguais.
