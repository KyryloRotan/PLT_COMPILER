### Installation
```
sudo apt-get install bison flex
```
### Compile the Lexer:

```
lex plt_lexer.l
gcc lex.yy.c -o plt_lexer -ll
```
### Run:

```
 ./plt_lexer plt_example.txt
```


### **Defined Tokens**

Here's a list of the defined tokens in the lexer, matched with their corresponding words. This will be useful for documenting the tokens in your README.

---

### **Defined Tokens**

| **Token Name**          | **Description**                                         | **Example Lexeme** |
|-------------------------|---------------------------------------------------------|---------------------|
| **T_FUNCTION**          | Keyword for defining a function                         | `function`         |
| **T_IF**                | Keyword for conditional branching                       | `if`               |
| **T_ELSE**              | Keyword for alternative conditional branch              | `else`             |
| **T_FOR**               | Keyword for looping                                     | `for`              |
| **T_RETURN**            | Keyword for returning a value from a function           | `return`           |
| **T_TRUE**              | Boolean literal representing true                       | `true`             |
| **T_FALSE**             | Boolean literal representing false                      | `false`            |
| **T_IDENTIFIER**        | Variable or function names                              | `n`, `isPrime`     |
| **T_INT_LITERAL**       | Integer constant                                        | `0`, `1`, `2`      |
| **T_PLUS**              | Arithmetic addition operator                            | `+`                |
| **T_MINUS**             | Arithmetic subtraction operator                         | `-`                |
| **T_MULTIPLY**          | Arithmetic multiplication operator                      | `*`                |
| **T_DIVIDE**            | Arithmetic division operator                            | `/`                |
| **T_MODULO**            | Arithmetic remainder operator                           | `%`                |
| **T_INCREMENT**         | Increment operator                                      | `++`               |
| **T_DECREMENT**         | Decrement operator                                      | `--`               |
| **T_ASSIGN**            | Assignment operator                                     | `=`                |
| **T_EQUAL**             | Relational equality operator                            | `==`               |
| **T_NOT_EQUAL**         | Relational inequality operator                          | `!=`               |
| **T_LESS**              | Relational less-than operator                           | `<`                |
| **T_LESS_EQUAL**        | Relational less-than-or-equal-to operator               | `<=`               |
| **T_GREATER**           | Relational greater-than operator                        | `>`                |
| **T_GREATER_EQUAL**     | Relational greater-than-or-equal-to operator            | `>=`               |
| **T_AND**               | Logical AND operator                                    | `&&`               |
| **T_OR**                | Logical OR operator                                     | `||`               |
| **T_LEFT_PAREN**        | Left parenthesis used in expressions and function calls | `(`                |
| **T_RIGHT_PAREN**       | Right parenthesis used in expressions and function calls| `)`                |
| **T_LEFT_BRACE**        | Left brace marking start of block                       | `{`                |
| **T_RIGHT_BRACE**       | Right brace marking end of block                        | `}`                |
| **T_SEMICOLON**         | Semicolon used to terminate statements                  | `;`                |
| **T_COMMA**             | Comma used in argument lists                            | `,`                |


