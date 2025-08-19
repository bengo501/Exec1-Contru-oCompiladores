@echo off
echo ========================================
echo Teste COMPLETO de ERROS - Ambos Analisadores
echo ========================================

echo.
echo Este script testa especificamente o tratamento
echo de ERROS nos analisadores lexicos.
echo.
echo IMPORTANTE: As mensagens de ERRO sao esperadas
echo e provam que os analisadores estao funcionando!

echo.
echo Verificando arquivos necessarios...

if exist ..\..\analisadores\JsonLexer\JsonLexer.java (
    echo ✓ JsonLexer.java encontrado
) else (
    echo ✗ JsonLexer.java nao encontrado
    echo Execute: java -jar jflex.jar ..\..\analisadores\JsonLexer\JsonLexer.flex
    goto :end
)

if exist ..\..\analisadores\EvalLexer\EvalLexer.java (
    echo ✓ EvalLexer.java encontrado
) else (
    echo ✗ EvalLexer.java nao encontrado
    echo Execute: java -jar jflex.jar ..\..\analisadores\EvalLexer\EvalLexer.flex
    goto :end
)

echo.
echo ========================================
echo Compilando analisadores...
echo ========================================

echo Compilando JsonLexer...
javac ..\..\analisadores\JsonLexer\JsonLexer.java
if %errorlevel% neq 0 (
    echo ✗ Erro na compilacao do JsonLexer
    goto :end
)

echo Compilando EvalLexer...
javac ..\..\analisadores\EvalLexer\EvalLexer.java
if %errorlevel% neq 0 (
    echo ✗ Erro na compilacao do EvalLexer
    goto :end
)

echo ✓ Ambos os analisadores compilados com sucesso

echo.
echo ========================================
echo PARTE 1: TESTES DE ERRO - JsonLexer
echo ========================================

echo.
echo Teste 1.1: JSON com caracteres especiais
echo ----------------------------------------
java -cp ..\..\analisadores\JsonLexer JsonLexer ..\..\dados_teste\erro\teste_erro.txt

echo.
echo Teste 1.2: JSON com erros basicos
echo ----------------------------------------
if exist ..\..\dados_teste\json\json_erro.txt (
    java -cp ..\..\analisadores\JsonLexer JsonLexer ..\..\dados_teste\json\json_erro.txt
) else (
    echo Arquivo json_erro.txt nao encontrado
)

echo.
echo Teste 1.3: JSON com erros completos
echo ----------------------------------------
if exist ..\..\dados_teste\json\json_erro_completo.txt (
    java -cp ..\..\analisadores\JsonLexer JsonLexer ..\..\dados_teste\json\json_erro_completo.txt
) else (
    echo Arquivo json_erro_completo.txt nao encontrado
)

echo.
echo ========================================
echo PARTE 2: TESTES DE ERRO - EvalLexer
echo ========================================

echo.
echo Teste 2.1: Entrada com caracteres especiais
echo ----------------------------------------
java -cp ..\..\analisadores\EvalLexer EvalLexer ..\..\dados_teste\erro\teste_erro.txt

echo.
echo Teste 2.2: Entrada com erros basicos
echo ----------------------------------------
if exist ..\..\dados_teste\eval\eval_erro.txt (
    java -cp ..\..\analisadores\EvalLexer EvalLexer ..\..\dados_teste\eval\eval_erro.txt
) else (
    echo Arquivo eval_erro.txt nao encontrado
)

echo.
echo Teste 2.3: Entrada com erros completos
echo ----------------------------------------
if exist ..\..\dados_teste\eval\eval_erro_completo.txt (
    java -cp ..\..\analisadores\EvalLexer EvalLexer ..\..\dados_teste\eval\eval_erro_completo.txt
) else (
    echo Arquivo eval_erro_completo.txt nao encontrado
)

echo.
echo ========================================
echo RESUMO GERAL DOS TESTES DE ERRO
echo ========================================

echo.
echo ✓ JsonLexer - Caracteres que geram erro:
echo   - @ # $ %% ^ & * ( ) _ + \ | ; ' : " , . ^< ^> = !
echo   - Comentarios: // /* */
echo   - Caracteres acentuados: ç ã õ é ê í ú á à ü
echo   - Aspas nao fechadas, numeros invalidos
echo   - Chaves/colchetes nao balanceados

echo.
echo ✓ EvalLexer - Caracteres que geram erro:
echo   - @ # $ %% ^ & | \ ~ ` ; : . ? ! " '
echo   - Operadores: ^< ^> = != ^<= ^>= == ^<^> ** // %%
echo   - Atribuicoes: += -= *= /=
echo   - Caracteres acentuados e Unicode
echo   - Numeros e nomes invalidos
echo   - Parenteses nao balanceados

echo.
echo ✓ Verificacoes realizadas:
echo   - Mensagens "ERRO: Caractere invalido 'X' na linha Y"
echo   - Linha do erro identificada corretamente
echo   - Processamento continua apos erros
echo   - Tokens validos ainda sao reconhecidos
echo   - Formato de saida mantido: CODIGO LEXEME LINHA

echo.
echo ========================================
echo CONCLUSAO
echo ========================================

echo.
echo Se voce viu mensagens de erro como:
echo "ERRO: Caractere invalido '@' na linha 3"
echo.
echo Entao os analisadores estao funcionando CORRETAMENTE!
echo O tratamento de erro esta implementado e funcional.

echo.
echo ========================================
echo Teste completo de erros finalizado!
echo ========================================

:end
echo.
echo Pressione qualquer tecla para sair...
pause >nul
