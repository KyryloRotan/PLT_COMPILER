%{
 /* Definitions Section */
#include <stdio.h>
#include <stdlib.h>

 /* Token definitions */
enum Tokens {
    T_FUNCTION = 256,
    T_IF,
    T_ELSE,
    T_FOR,
    T_RETURN,
    T_TRUE,
    T_FALSE,
    T_INT_LITERAL,
    T_IDENTIFIER,
    T_PLUS,
    T_MINUS,
    T_MULTIPLY,
    T_DIVIDE,
    T_MODULO,
    T_INCREMENT,
    T_DECREMENT,
    T_ASSIGN,
    T_EQUAL,
    T_NOT_EQUAL,
    T_LESS,
    T_LESS_EQUAL,
    T_GREATER,
    T_GREATER_EQUAL,
    T_AND,
    T_OR,
    T_LEFT_PAREN,
    T_RIGHT_PAREN,
    T_LEFT_BRACE,
    T_RIGHT_BRACE,
    T_SEMICOLON,
    T_COMMA
};

void yyerror(const char *s);
int yylex(void);
%}

%%

 /* Rules Section */

 /* Keywords */
"function"      { printf("<T_FUNCTION, 'function'>\n"); }
"if"            { printf("<T_IF, 'if'>\n"); }
"else"          { printf("<T_ELSE, 'else'>\n"); }
"for"           { printf("<T_FOR, 'for'>\n"); }
"return"        { printf("<T_RETURN, 'return'>\n"); }
"true"          { printf("<T_TRUE, 'true'>\n"); }
"false"         { printf("<T_FALSE, 'false'>\n"); }

 /* Identifiers */
[a-zA-Z_][a-zA-Z0-9_]* {
    printf("<T_IDENTIFIER, '%s'>\n", yytext);
}

 /* Integer Literals */
[0-9]+ {
    printf("<T_INT_LITERAL, '%s'>\n", yytext);
}

 /* Operators */
"++"            { printf("<T_INCREMENT, '++'>\n"); }
"--"            { printf("<T_DECREMENT, '--'>\n"); }
"=="            { printf("<T_EQUAL, '=='>\n"); }
"!="            { printf("<T_NOT_EQUAL, '!='>\n"); }
"<="            { printf("<T_LESS_EQUAL, '<='>\n"); }
">="            { printf("<T_GREATER_EQUAL, '>='>\n"); }
"&&"            { printf("<T_AND, '&&'>\n"); }
"||"            { printf("<T_OR, '||'>\n"); }
"="             { printf("<T_ASSIGN, '='>\n"); }
"<"             { printf("<T_LESS, '<'>\n"); }
">"             { printf("<T_GREATER, '>'>\n"); }
"\+"            { printf("<T_PLUS, '+'>\n"); }
"-"             { printf("<T_MINUS, '-'>\n"); }
"\*"            { printf("<T_MULTIPLY, '*'>\n"); }
"/"             { printf("<T_DIVIDE, '/'>\n"); }
"%"             { printf("<T_MODULO, '%'>\n"); }

 /* Delimiters and Punctuation */
"\("            { printf("<T_LEFT_PAREN, '('>\n"); }
"\)"            { printf("<T_RIGHT_PAREN, ')'>\n"); }
"\{"            { printf("<T_LEFT_BRACE, '{'>\n"); }
"\}"            { printf("<T_RIGHT_BRACE, '}'>\n"); }
";"             { printf("<T_SEMICOLON, ';'>\n"); }
","             { printf("<T_COMMA, ','>\n"); }

 /* Whitespace (ignored) */
[ \t\r\n]+      {  /* Skip whitespace */ }

 /* Error handling */
. {
    printf("Error: Unrecognized character '%s'\n", yytext);
}

%%

 /* User Code Section */

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            fprintf(stderr, "Cannot open file %s\n", argv[1]);
            exit(1);
        }
        yyin = file;
    }

    yylex();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
