# Analisadores Léxicos - Exercícios de Compiladores

Este projeto contém implementações de analisadores léxicos usando JFlex para dois exercícios específicos, organizados em uma estrutura clara e bem documentada.

## 📁 Estrutura do Projeto

```
Exec1-Contru-oCompiladores/
├── 📁 analisadores/
│   ├── 📁 JsonLexer/
│   │   ├── JsonLexer.flex
│   │   ├── JsonLexer.java
│   │   └── JsonLexer.class
│   └── 📁 EvalLexer/
│       ├── EvalLexer.flex
│       ├── EvalLexer.java
│       └── EvalLexer.class
├── 📁 scripts/
│   ├── 📁 teste/
│   │   ├── teste_json.bat
│   │   └── teste_eval.bat
│   ├── 📁 erro/
│   │   ├── teste_json_erros.bat
│   │   └── teste_eval_erros.bat
│   └── 📁 completo/
│       ├── teste_completo.bat
│       ├── teste_todos_erros.bat
│       └── testar_analisadores.bat
├── 📁 dados_teste/
│   ├── 📁 json/
│   │   ├── teste_json.txt
│   │   ├── json_test.txt
│   │   ├── json_erro.txt
│   │   ├── json_erro_completo.txt
│   │   ├── json_unicode_erro.txt
│   │   └── test.json
│   ├── 📁 eval/
│   │   ├── teste_avaliacao.txt
│   │   ├── eval_test.txt
│   │   ├── eval_erro.txt
│   │   ├── eval_erro_completo.txt
│   │   └── eval_numeros_erro.txt
│   └── 📁 erro/
│       └── teste_erro.txt
├── 📁 documentacao/
│   ├── GUIA_TESTES.md
│   ├── RESUMO_TESTES.md
│   ├── RESUMO_TESTES_ERRO.md
│   └── GUIA_TESTE_ANALISADORES.md
├── executar_testes.bat
└── README.md
```

## 🚀 Como Usar

### Opção 1: Script Principal (Recomendado)
```bash
executar_testes.bat
```
Este script oferece um menu interativo com todas as opções de teste.

### Opção 2: Comandos Manuais

#### 1. Gerar os arquivos Java
```bash
java -jar jflex.jar analisadores\JsonLexer\JsonLexer.flex
java -jar jflex.jar analisadores\EvalLexer\EvalLexer.flex
```

#### 2. Compilar
```bash
javac analisadores\JsonLexer\JsonLexer.java
javac analisadores\EvalLexer\EvalLexer.java
```

#### 3. Executar Testes
```bash
# Teste individual JsonLexer
scripts\teste\teste_json.bat

# Teste individual EvalLexer
scripts\teste\teste_eval.bat

# Teste completo (ambos analisadores)
scripts\completo\teste_completo.bat

# Teste apenas erros
scripts\completo\teste_todos_erros.bat
```

## 📋 Tipos de Teste Disponíveis

### Testes Individuais
- **JsonLexer**: `scripts\teste\teste_json.bat`
- **EvalLexer**: `scripts\teste\teste_eval.bat`

### Testes de Erro
- **JsonLexer Erros**: `scripts\erro\teste_json_erros.bat`
- **EvalLexer Erros**: `scripts\erro\teste_eval_erros.bat`

### Testes Completos
- **Todos os Testes**: `scripts\completo\teste_completo.bat`
- **Todos os Erros**: `scripts\completo\teste_todos_erros.bat`

## 📊 Formato de Saída

Cada analisador produz saída no formato:
```
CÓDIGO LEXEME LINHA
```

Onde:
- **CÓDIGO**: Número identificador do token
- **LEXEME**: Texto reconhecido
- **LINHA**: Número da linha onde o token foi encontrado

## 📚 Documentação

- **`documentacao\GUIA_TESTES.md`** - Guia completo de testes
- **`documentacao\RESUMO_TESTES.md`** - Resumo dos arquivos de teste
- **`documentacao\RESUMO_TESTES_ERRO.md`** - Resumo dos testes de erro
- **`documentacao\GUIA_TESTE_ANALISADORES.md`** - Guia para provar a correção

## 🎯 Características dos Analisadores

### JsonLexer
- Reconhece tokens JSON: `{`, `}`, `[`, `]`, `:`, `,`, strings, números, booleanos, null
- Tratamento de erros para caracteres inválidos
- Contagem de linhas
- Códigos de token: 1-11

### EvalLexer
- Reconhece tokens do sistema de avaliação: nomes, operadores, números, parênteses
- Tratamento de erros para caracteres inválidos
- Contagem de linhas
- Códigos de token: 1-12

## ✅ Critérios de Sucesso

Os testes passam quando:
- ✅ Todos os tokens válidos são reconhecidos
- ✅ Códigos dos tokens estão corretos
- ✅ Linhas são contadas corretamente
- ✅ Caracteres inválidos geram mensagens de erro
- ✅ Formato de saída está correto
- ✅ EOF é impresso ao final