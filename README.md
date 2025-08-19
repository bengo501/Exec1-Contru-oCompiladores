# Exercícios de Análise Léxica - JFlex
## Exercício 1: Analisador Léxico para JSON
### Arquivos:
- `JsonLexer.flex` - Especificação JFlex para JSON
- `teste_json.txt` - Arquivo de teste JSON

### Tokens reconhecidos:
- `LBRACE` (1) - Chave de abertura `{`
- `RBRACE` (2) - Chave de fechamento `}`
- `LBRACKET` (3) - Colchete de abertura `[`
- `RBRACKET` (4) - Colchete de fechamento `]`
- `COLON` (5) - Dois pontos `:`
- `COMMA` (6) - Vírgula `,`
- `STRING` (7) - Strings entre aspas duplas
- `NUMBER` (8) - Números (inteiros e decimais)
- `TRUE` (9) - Literal `true`
- `FALSE` (10) - Literal `false`
- `NULL` (11) - Literal `null`
- `EOF` (12) - Fim do arquivo

### Como usar:
```bash
jflex JsonLexer.flex
javac JsonLexer.java
java JsonLexer teste_json.txt
```

## Exercício 2: Analisador Léxico para Sistema de Avaliação
### Arquivos:
- `EvalLexer.flex` - Especificação JFlex para sistema de avaliação
- `teste_avaliacao.txt` - Arquivo de teste do sistema de avaliação
### Tokens reconhecidos:
- `COMMA` (1) - Vírgula `,`
- `LPAREN` (2) - Parêntese de abertura `(`
- `RPAREN` (3) - Parêntese de fechamento `)`
- `PLUS` (4) - Soma `+`
- `MINUS` (5) - Subtração `-`
- `TIMES` (6) - Multiplicação `*`
- `DIVIDE` (7) - Divisão `/`
- `INTEGER` (8) - Números inteiros
- `FLOAT` (9) - Números em ponto flutuante
- `NAME` (10) - Nomes de avaliação (P1, PS, ME, TF, etc.)
- `SUBST_TYPE` (11) - Tipo de substituição (0, 1, 2)
- `NEWLINE` (12) - Quebra de linha
- `EOF` (13) - Fim do arquivo

### Como usar:
```bash
jflex EvalLexer.flex
javac EvalLexer.java
java EvalLexer teste_avaliacao.txt
```

## Compilação e Teste Automático
Execute o script `compilar_e_testar.bat` para compilar e testar ambos os analisadores automaticamente.

## Formato de Saída
Cada analisador léxico mostra a saída no formato:
```
CÓDIGO LEXEME          LINHA
```