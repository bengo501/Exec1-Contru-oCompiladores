%%

%public
%class EvalLexer
%unicode
%line
%column
%type int

%{
/******************************************************
 * EvalLexer - Analisador Léxico para Sistema de     *
 * Avaliação                                          *
 *                                                    *
 * Para cada token reconhecido mostra:               *
 *   CÓDIGO	LEXEME	LINHA                           *
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
    EvalLexer lexer = new EvalLexer(reader);
    int token;
    // CORREÇÃO: comparar com YYEOF (-1) corretamente
    while ((token = lexer.yylex()) != YYEOF) {
        // impressão já feita em emit()
    }
    // Imprimir EOF apenas uma vez ao final
    System.out.printf("%-5d %-15s %d%n", -1, "EOF", lexer.yyline);
}

%}

%%

// === SEÇÃO 2: REGRAS LÉXICAS ===
// IMPORTANTE: Ordem das regras importa! Mais específicas primeiro.

// Operadores (símbolos únicos)
","                      { emit(COMMA, "COMMA"); return COMMA; }
"("                      { emit(LPAREN, "LPAREN"); return LPAREN; }
")"                      { emit(RPAREN, "RPAREN"); return RPAREN; }
"+"                      { emit(PLUS, "PLUS"); return PLUS; }
"-"                      { emit(MINUS, "MINUS"); return MINUS; }
"*"                      { emit(TIMES, "TIMES"); return TIMES; }
"/"                      { emit(DIVIDE, "DIVIDE"); return DIVIDE; }

// Números em ponto flutuante (deve vir ANTES de inteiros)
[0-9]+\.[0-9]+          { emit(FLOAT, "FLOAT"); return FLOAT; }

// Tipos de substituição específicos (deve vir ANTES de inteiros)
[012]                   { emit(SUBST_TYPE, "SUBST_TYPE"); return SUBST_TYPE; }

// Números inteiros (deve vir DEPOIS de float e subst_type)
[0-9]+                  { emit(INTEGER, "INTEGER"); return INTEGER; }

// Nomes de avaliação (P1, PS, ME, TF, etc.) - permite nomes maiores
[A-Za-z][A-Za-z0-9]*    { emit(NAME, "NAME"); return NAME; }

// Espaços em branco (ignorar)
[\t\r\f ]+              { /* ignorar espaços em branco */ }

// Quebra de linha (importante para algumas aplicações)
\n                       { emit(NEWLINE, "NEWLINE"); return NEWLINE; }

// Caracteres inválidos (capturar erros)
.                        { System.out.printf("ERRO: Caractere inválido '%s' na linha %d%n", yytext(), yyline); }

// Fim de arquivo
<<EOF>>                 { return YYEOF; }
