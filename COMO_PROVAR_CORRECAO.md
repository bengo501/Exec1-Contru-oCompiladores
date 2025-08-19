# Como Provar que os Analisadores Léxicos Estão Corretos

## ✅ **Status Atual Confirmado**
- ✅ JFlex gerou os arquivos Java com sucesso (0 erros, 0 warnings)
- ✅ JsonLexer.java criado
- ✅ EvalLexer.java criado
- ✅ Arquivos de teste criados

## 🎯 **Passos para Provar a Correção**

### **1. Compilar os Analisadores**
```bash
javac JsonLexer.java
javac EvalLexer.java
```

### **2. Testar o Analisador JSON**
```bash
java JsonLexer teste_json.txt
```

**Resultado Esperado:**
```
1     {               0
7     "id"            1
5     :               1
8     1               1
6     ,               1
7     "name"          2
5     :               2
7     "Toner para Impressora XK 4532" 2
6     ,               2
7     "price"         3
5     :               3
8     219.23          3
6     ,               3
7     "tags"          4
5     :               4
3     [               4
7     "Toner"         4
6     ,               4
7     "4532"          4
4     ]               4
6     ,               4
7     "stock"         5
5     :               5
1     {               5
7     "shopping iguatemi" 6
5     :               6
8     3               6
2     }               7
2     }               8
12    EOF             9
```

### **3. Testar o Analisador de Sistema de Avaliação**
```bash
java EvalLexer teste_avaliacao.txt
```

**Resultado Esperado:**
```
10    P1              0
1     ,               0
10    PS              0
1     ,               0
10    ME              0
1     ,               0
10    TF              0
12    NEWLINE         0
11    1               1
12    NEWLINE         1
2     (               2
2     (               2
2     (               2
10    P1              2
4     +               2
10    ME              2
3     )               2
4     +               2
10    TF              2
3     )               2
7     /               2
8     2               2
3     )               2
12    NEWLINE         2
10    PS              3
12    NEWLINE         3
13    EOF             4
```

## 📋 **Critérios de Verificação**

### **Para o Analisador JSON:**

**✅ Tokens Reconhecidos:**
- `LBRACE` (1) - Chaves de abertura `{`
- `RBRACE` (2) - Chaves de fechamento `}`
- `LBRACKET` (3) - Colchetes de abertura `[`
- `RBRACKET` (4) - Colchetes de fechamento `]`
- `COLON` (5) - Dois pontos `:`
- `COMMA` (6) - Vírgulas `,`
- `STRING` (7) - Strings entre aspas duplas
- `NUMBER` (8) - Números (inteiros e decimais)
- `TRUE` (9) - Literal `true`
- `FALSE` (10) - Literal `false`
- `NULL` (11) - Literal `null`
- `EOF` (12) - Fim do arquivo

**✅ Verificações:**
- [ ] Todos os símbolos estruturais são reconhecidos
- [ ] Strings são reconhecidas corretamente
- [ ] Números são reconhecidos (inteiros e decimais)
- [ ] Linhas são contadas corretamente
- [ ] Formato de saída está correto (CÓDIGO LEXEME LINHA)

### **Para o Analisador de Sistema de Avaliação:**

**✅ Tokens Reconhecidos:**
- `COMMA` (1) - Vírgulas `,`
- `LPAREN` (2) - Parênteses de abertura `(`
- `RPAREN` (3) - Parênteses de fechamento `)`
- `PLUS` (4) - Soma `+`
- `MINUS` (5) - Subtração `-`
- `TIMES` (6) - Multiplicação `*`
- `DIVIDE` (7) - Divisão `/`
- `INTEGER` (8) - Números inteiros
- `FLOAT` (9) - Números em ponto flutuante
- `NAME` (10) - Nomes de avaliação (P1, PS, ME, TF)
- `SUBST_TYPE` (11) - Tipos de substituição (0, 1, 2)
- `NEWLINE` (12) - Quebras de linha
- `EOF` (13) - Fim do arquivo

**✅ Verificações:**
- [ ] Nomes de avaliação seguem o padrão (letra + opcional letra/dígito)
- [ ] Operadores aritméticos são reconhecidos
- [ ] Números inteiros e decimais são reconhecidos
- [ ] Tipos de substituição (0, 1, 2) são reconhecidos
- [ ] Quebras de linha são contadas
- [ ] Formato de saída está correto

## 🔍 **Testes Adicionais**

### **Teste com Entrada Inválida:**
```bash
java JsonLexer teste_erro.txt
```
Deve mostrar mensagens de erro para caracteres inválidos.

### **Teste de Casos Extremos:**
- Arquivos vazios
- Strings muito longas
- Números muito grandes
- Fórmulas complexas

## 📊 **Como Provar que Estão Corretos:**

1. **Execute os comandos de teste** acima
2. **Compare os resultados** com os esperados
3. **Verifique se todos os tokens** são reconhecidos corretamente
4. **Confirme se as linhas** são contadas corretamente
5. **Teste com entradas inválidas** para verificar tratamento de erros
6. **Compare com os requisitos** do enunciado dos exercícios

## 🎯 **Critérios de Sucesso Final:**

### **Analisador JSON:**
- ✅ Reconhece todos os tokens da gramática JSON fornecida
- ✅ Mostra código, lexeme e linha conforme solicitado
- ✅ Processa corretamente o JSON de exemplo

### **Analisador Sistema de Avaliação:**
- ✅ Reconhece nomes de avaliação no formato correto
- ✅ Reconhece operadores aritméticos
- ✅ Reconhece tipos de substituição
- ✅ Processa corretamente o arquivo de exemplo

## 📝 **Comandos Finais:**

```bash
# Compilar
javac JsonLexer.java
javac EvalLexer.java

# Testar JSON
java JsonLexer teste_json.txt

# Testar Sistema de Avaliação
java EvalLexer teste_avaliacao.txt

# Testar com entrada inválida
java JsonLexer teste_erro.txt
```

**Execute estes comandos e compare os resultados com os esperados para provar que os analisadores estão corretos!**
