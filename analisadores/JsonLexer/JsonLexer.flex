%%

%public
%class JsonLexer
%unicode
%line
%column
%type int

%{
/******************************************************
 * JsonLexer - Analisador Léxico para JSON           *
 *                                                    *
 * Para cada token reconhecido mostra:               *
 *   CÓDIGO	LEXEME	LINHA                           *
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
    JsonLexer lexer = new JsonLexer(reader);
    int token;
    // CORREÇÃO: comparar com YYEOF (-1) em vez de EOF (12)
    while ((token = lexer.yylex()) != YYEOF) {
        // impressão já feita em emit()
    }
    // Imprimir EOF apenas uma vez ao final
    System.out.printf("%-5d %-15s %d%n", -1, "EOF", lexer.yyline);
}

%}

%%

// === SEÇÃO 2: REGRAS LÉXICAS ===

// Operadores estruturais (ordem importa!)
"{"                      { emit(LBRACE, "LBRACE"); return LBRACE; }
"}"                      { emit(RBRACE, "RBRACE"); return RBRACE; }
"["                      { emit(LBRACKET, "LBRACKET"); return LBRACKET; }
"]"                      { emit(RBRACKET, "RBRACKET"); return RBRACKET; }
":"                      { emit(COLON, "COLON"); return COLON; }
","                      { emit(COMMA, "COMMA"); return COMMA; }

// Palavras-chave (devem vir antes de identificadores)
"true"                   { emit(TRUE, "TRUE"); return TRUE; }
"false"                  { emit(FALSE, "FALSE"); return FALSE; }
"null"                   { emit(NULL, "NULL"); return NULL; }

// Strings JSON (regex complexa)
\"([^\"\\\n]|\\[\"\\\/bfnrt]|\\u[0-9a-fA-F]{4})*\"    { emit(STRING, "STRING"); return STRING; }

// Números JSON (suporte completo)
-?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][+-]?[0-9]+)?   { emit(NUMBER, "NUMBER"); return NUMBER; }

// Espaços em branco (ignorar)
[\t\r\f ]+              { /* ignorar espaços em branco */ }

// Quebras de linha (ignorar)
\n                       { /* ignorar quebras de linha */ }

// Caracteres inválidos (capturar erros)
.                        { System.out.printf("ERRO: Caractere inválido '%s' na linha %d%n", yytext(), yyline); }

// Fim de arquivo
<<EOF>>                 { return YYEOF; }
