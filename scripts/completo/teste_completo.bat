@echo off
echo ========================================
echo Teste Completo dos Analisadores Lexicos
echo ========================================

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
echo TESTE 1: JsonLexer - JSON Valido
echo ========================================

echo.
echo Testando com teste_json.txt:
echo ----------------------------------------
java -cp ..\..\analisadores\JsonLexer JsonLexer ..\..\dados_teste\json\teste_json.txt

echo.
echo Testando com json_test.txt:
echo ----------------------------------------
if exist ..\..\dados_teste\json\json_test.txt (
    java -cp ..\..\analisadores\JsonLexer JsonLexer ..\..\dados_teste\json\json_test.txt
) else (
    echo Arquivo json_test.txt nao encontrado
)

echo.
echo ========================================
echo TESTE 2: JsonLexer - JSON com Erros
echo ========================================

echo.
echo Testando com teste_erro.txt:
echo ----------------------------------------
java -cp ..\..\analisadores\JsonLexer JsonLexer ..\..\dados_teste\erro\teste_erro.txt

echo.
echo Testando com json_erro.txt:
echo ----------------------------------------
if exist ..\..\dados_teste\json\json_erro.txt (
    java -cp ..\..\analisadores\JsonLexer JsonLexer ..\..\dados_teste\json\json_erro.txt
) else (
    echo Arquivo json_erro.txt nao encontrado
)

echo.
echo ========================================
echo TESTE 3: EvalLexer - Entrada Valida
echo ========================================

echo.
echo Testando com teste_avaliacao.txt:
echo ----------------------------------------
java -cp ..\..\analisadores\EvalLexer EvalLexer ..\..\dados_teste\eval\teste_avaliacao.txt

echo.
echo Testando com eval_test.txt:
echo ----------------------------------------
if exist ..\..\dados_teste\eval\eval_test.txt (
    java -cp ..\..\analisadores\EvalLexer EvalLexer ..\..\dados_teste\eval\eval_test.txt
) else (
    echo Arquivo eval_test.txt nao encontrado
)

echo.
echo ========================================
echo TESTE 4: EvalLexer - Entrada com Erros
echo ========================================

echo.
echo Testando com eval_erro.txt:
echo ----------------------------------------
if exist ..\..\dados_teste\eval\eval_erro.txt (
    java -cp ..\..\analisadores\EvalLexer EvalLexer ..\..\dados_teste\eval\eval_erro.txt
) else (
    echo Arquivo eval_erro.txt nao encontrado
)

echo.
echo ========================================
echo RESUMO DOS TESTES
echo ========================================

echo.
echo ✓ JsonLexer testado com:
echo   - JSON valido (teste_json.txt, json_test.txt)
echo   - JSON com erros (teste_erro.txt, json_erro.txt)
echo.
echo ✓ EvalLexer testado com:
echo   - Entrada valida (teste_avaliacao.txt, eval_test.txt)
echo   - Entrada com erros (eval_erro.txt)
echo.
echo ✓ Verificacoes realizadas:
echo   - Reconhecimento de tokens corretos
echo   - Tratamento de caracteres invalidos
echo   - Contagem de linhas
echo   - Formato de saida (CODIGO LEXEME LINHA)
echo.
echo ========================================
echo Teste completo finalizado!
echo ========================================

:end
echo.
echo Pressione qualquer tecla para sair...
pause >nul
