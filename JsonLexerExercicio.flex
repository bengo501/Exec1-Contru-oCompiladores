%%

%public
%class JsonLexerExercicio
%unicode
%line
%column
%type int
%{
/******************************************************
 * JsonLexerExercicio - Analisador Léxico para JSON   *
 *                                                    *
 * Para cada token reconhecido mostra:               *
 *   CÓDIGO\tLEXEME\tLINHA                           *
 ******************************************************/

// Códigos dos tokens
public static final int LBRACE = 1;      // {
public static final int RBRACE = 2;      // }
public static final int LBRACKET = 3;    // [
public static final int RBRACKET = 4;    // ]
public static final int COLON = 5;       // :
public static final int COMMA = 6;       // ,
public static final int STRING = 7;      // strings
public static final int NUMBER = 8;      // números
public static final int TRUE = 9;        // true
public static final int FALSE = 10;      // false
public static final int NULL = 11;       // null
public static final int EOF = 12;        // fim do arquivo

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
    JsonLexerExercicio lexer = new JsonLexerExercicio(reader);
    int token;
    while ((token = lexer.yylex()) != YYEOF) {
        // impressão já feita em emit()
    }
}

%}

%%

"{"                      { emit(LBRACE, "LBRACE"); return LBRACE; }
"}"                      { emit(RBRACE, "RBRACE"); return RBRACE; }
"["                      { emit(LBRACKET, "LBRACKET"); return LBRACKET; }
"]"                      { emit(RBRACKET, "RBRACKET"); return RBRACKET; }
":"                      { emit(COLON, "COLON"); return COLON; }
","                      { emit(COMMA, "COMMA"); return COMMA; }

"true"                   { emit(TRUE, "TRUE"); return TRUE; }
"false"                  { emit(FALSE, "FALSE"); return FALSE; }
"null"                   { emit(NULL, "NULL"); return NULL; }

\"([^\"\n\\]|\\[\"\\/bfnrt]|\\u[0-9a-fA-F]{4})*\"    { emit(STRING, "STRING"); return STRING; }

-?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][+-]?[0-9]+)?   { emit(NUMBER, "NUMBER"); return NUMBER; }

[\t\r\f ]+              { /* ignorar espaços em branco */ }

\n                       { /* ignorar quebras de linha */ }

.                        { System.out.printf("ERRO: Caractere inválido '%s' na linha %d%n", yytext(), yyline); }

<<EOF>>                 { emit(EOF, "EOF"); return EOF; }
