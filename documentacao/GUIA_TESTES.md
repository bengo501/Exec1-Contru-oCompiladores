# Guia de Testes dos Analisadores Léxicos

## 📁 **Arquivos de Teste Criados**

### **Scripts de Teste (.bat):**
- `teste_json.bat` - Testa apenas o JsonLexer
- `teste_eval.bat` - Testa apenas o EvalLexer
- `teste_completo.bat` - Testa ambos os analisadores
- `teste_json_erros.bat` - Testa APENAS erros do JsonLexer
- `teste_eval_erros.bat` - Testa APENAS erros do EvalLexer
- `teste_todos_erros.bat` - Testa erros de ambos os analisadores
- `testar_analisadores.bat` - Script original atualizado

### **Arquivos de Teste (.txt):**

#### **Para JsonLexer:**
- `teste_json.txt` - JSON básico do exercício
- `json_test.txt` - JSON complexo com todos os tipos
- `teste_erro.txt` - JSON com caracteres inválidos
- `json_erro.txt` - JSON com erros específicos
- `json_erro_completo.txt` - JSON com todos os tipos de erro
- `json_unicode_erro.txt` - JSON com caracteres Unicode inválidos
- `test.json` - JSON existente no projeto

#### **Para EvalLexer:**
- `teste_avaliacao.txt` - Sistema de avaliação do exercício
- `eval_test.txt` - Expressões aritméticas variadas
- `eval_erro.txt` - Entrada com caracteres inválidos
- `eval_erro_completo.txt` - Entrada com todos os tipos de erro
- `eval_numeros_erro.txt` - Números inválidos específicos

## 🚀 **Como Executar os Testes**

### **1. Preparação:**
```bash
# Gerar os arquivos Java
java -jar jflex.jar JsonLexer.flex
java -jar jflex.jar EvalLexer.flex
```

### **2. Executar Testes Individuais:**
```bash
# Testar apenas JsonLexer
teste_json.bat

# Testar apenas EvalLexer
teste_eval.bat
```

### **3. Executar Testes de Erro:**
```bash
# Testar APENAS erros do JsonLexer
teste_json_erros.bat

# Testar APENAS erros do EvalLexer
teste_eval_erros.bat

# Testar erros de ambos os analisadores
teste_todos_erros.bat
```

### **4. Executar Teste Completo:**
```bash
# Testar ambos os analisadores (válidos e inválidos)
teste_completo.bat
```

## 📋 **Tipos de Teste Realizados**

### **JsonLexer:**
1. **JSON Válido:**
   - Reconhecimento de chaves `{` e `}`
   - Reconhecimento de colchetes `[` e `]`
   - Reconhecimento de strings entre aspas
   - Reconhecimento de números (inteiros e decimais)
   - Reconhecimento de booleanos (`true`, `false`)
   - Reconhecimento de `null`
   - Reconhecimento de dois pontos `:` e vírgulas `,`

2. **JSON com Erros:**
   - Caracteres especiais inválidos (`@#$%^&*()`)
   - Símbolos não permitidos (`< > = +`)
   - Caracteres acentuados (`çãõéê`)
   - Verificação de mensagens de erro

### **EvalLexer:**
1. **Entrada Válida:**
   - Nomes de avaliação (`P1`, `PS`, `ME`, `TF`)
   - Operadores aritméticos (`+`, `-`, `*`, `/`)
   - Parênteses `(` e `)`
   - Números inteiros e decimais
   - Tipos de substituição (`0`, `1`, `2`)
   - Vírgulas e quebras de linha

2. **Entrada com Erros:**
   - Caracteres especiais inválidos
   - Símbolos não permitidos
   - Verificação de mensagens de erro

## 🔍 **O que Verificar nos Testes**

### **Para JsonLexer:**
- ✅ Tokens reconhecidos corretamente
- ✅ Códigos dos tokens corretos (1-11)
- ✅ Linhas contadas corretamente
- ✅ Formato de saída: `CÓDIGO LEXEME LINHA`
- ✅ Mensagens de erro para caracteres inválidos

### **Para EvalLexer:**
- ✅ Tokens reconhecidos corretamente
- ✅ Códigos dos tokens corretos (1-12)
- ✅ Linhas contadas corretamente
- ✅ Formato de saída: `CÓDIGO LEXEME LINHA`
- ✅ Mensagens de erro para caracteres inválidos

## 📊 **Resultados Esperados**

### **JsonLexer - teste_json.txt:**
```
1     {               0
7     "id"            1
5     :               1
8     1               1
6     ,               1
...
-1    EOF             9
```

### **EvalLexer - teste_avaliacao.txt:**
```
10    P1              0
1     ,               0
10    PS              0
...
-1    EOF             4
```

### **Testes de Erro:**
```
ERRO: Caractere inválido '@' na linha 3
ERRO: Caractere inválido '#' na linha 4
...
```

## 🎯 **Critérios de Sucesso**

### **Teste Passa se:**
1. ✅ Todos os tokens válidos são reconhecidos
2. ✅ Códigos dos tokens estão corretos
3. ✅ Linhas são contadas corretamente
4. ✅ Caracteres inválidos geram mensagens de erro
5. ✅ Formato de saída está correto
6. ✅ EOF é impresso ao final

### **Teste Falha se:**
1. ❌ Tokens não são reconhecidos
2. ❌ Códigos dos tokens incorretos
3. ❌ Linhas não contadas corretamente
4. ❌ Caracteres inválidos não geram erro
5. ❌ Formato de saída incorreto
6. ❌ EOF não é impresso

## 📝 **Comandos Manuais**

Se preferir executar manualmente:

```bash
# Compilar
javac JsonLexer.java
javac EvalLexer.java

# Testar JsonLexer
java JsonLexer teste_json.txt
java JsonLexer json_test.txt
java JsonLexer teste_erro.txt

# Testar EvalLexer
java EvalLexer teste_avaliacao.txt
java EvalLexer eval_test.txt
java EvalLexer eval_erro.txt
```

## 🔧 **Solução de Problemas**

### **Erro: "javac não é reconhecido"**
- Instale o Java JDK
- Adicione o Java ao PATH
- Use o caminho completo: `"C:\Program Files\Java\jdk-version\bin\javac"`

### **Erro: "java -jar jflex.jar não funciona"**
- Verifique se o arquivo `jflex.jar` existe
- Use: `java -jar jflex.jar JsonLexer.flex`

### **Erro: "arquivo não encontrado"**
- Verifique se os arquivos .txt estão no diretório correto
- Execute os scripts do diretório do projeto

Os testes estão prontos para verificar se os analisadores léxicos estão funcionando corretamente!
