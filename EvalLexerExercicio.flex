%%

%public
%class EvalLexerExercicio
%unicode
%line
%column
%type int
%{
/******************************************************
 * EvalLexerExercicio - Analisador Léxico para       *
 * Sistema de Avaliação                               *
 *                                                    *
 * Para cada token reconhecido mostra:               *
 *   CÓDIGO\tLEXEME\tLINHA                           *
 ******************************************************/

// Códigos dos tokens
public static final int COMMA = 1;       // ,
public static final int LPAREN = 2;      // (
public static final int RPAREN = 3;      // )
public static final int PLUS = 4;        // +
public static final int MINUS = 5;       // -
public static final int TIMES = 6;       // *
public static final int DIVIDE = 7;      // /
public static final int INTEGER = 8;     // números inteiros
public static final int FLOAT = 9;       // números em ponto flutuante
public static final int NAME = 10;       // nomes de avaliação (P1, PS, ME, TF, etc.)
public static final int SUBST_TYPE = 11; // tipo de substituição (0, 1, 2)
public static final int NEWLINE = 12;    // quebra de linha
public static final int EOF = 13;        // fim do arquivo

private void emit(int tokenCode, String tokenName){
    System.out.printf("%-5d %-15s %d%n", tokenCode, yytext(), yyline);
}

public static void main(String[] args) throws Exception {
    java.io.Reader reader;
    if (args.length > 0) {
        reader = new java.io.FileReader(args[0]);
    } else {
        reader = new java.io.InputStreamReader(System.in);
    }
    EvalLexerExercicio lexer = new EvalLexerExercicio(reader);
    int token;
    while ((token = lexer.yylex()) != YYEOF) {
        // impressão já feita em emit()
    }
}

%}

%%

","                      { emit(COMMA, "COMMA"); return COMMA; }
"("                      { emit(LPAREN, "LPAREN"); return LPAREN; }
")"                      { emit(RPAREN, "RPAREN"); return RPAREN; }
"+"                      { emit(PLUS, "PLUS"); return PLUS; }
"-"                      { emit(MINUS, "MINUS"); return MINUS; }
"*"                      { emit(TIMES, "TIMES"); return TIMES; }
"/"                      { emit(DIVIDE, "DIVIDE"); return DIVIDE; }

"0"|"1"|"2"             { emit(SUBST_TYPE, "SUBST_TYPE"); return SUBST_TYPE; }

[0-9]+                  { emit(INTEGER, "INTEGER"); return INTEGER; }
[0-9]+\.[0-9]+          { emit(FLOAT, "FLOAT"); return FLOAT; }

[A-Za-z][A-Za-z0-9]?    { emit(NAME, "NAME"); return NAME; }

[\t\r\f ]+              { /* ignorar espaços em branco */ }

\n                       { emit(NEWLINE, "NEWLINE"); return NEWLINE; }

.                        { System.out.printf("ERRO: Caractere inválido '%s' na linha %d%n", yytext(), yyline); }

<<EOF>>                 { emit(EOF, "EOF"); return EOF; }
