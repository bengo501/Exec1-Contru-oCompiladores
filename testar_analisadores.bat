@echo off
echo ========================================
echo Testando Analisadores Lexicos
echo ========================================

echo.
echo Verificando se os arquivos Java foram gerados...

if exist JsonLexer.java (
    echo ✓ JsonLexer.java encontrado
) else (
    echo ✗ JsonLexer.java nao encontrado
    goto :end
)

if exist EvalLexer.java (
    echo ✓ EvalLexer.java encontrado
) else (
    echo ✗ EvalLexer.java nao encontrado
    goto :end
)

echo.
echo Verificando arquivos de teste...

if exist teste_json.txt (
    echo ✓ teste_json.txt encontrado
) else (
    echo ✗ teste_json.txt nao encontrado
    goto :end
)

if exist teste_avaliacao.txt (
    echo ✓ teste_avaliacao.txt encontrado
) else (
    echo ✗ teste_avaliacao.txt nao encontrado
    goto :end
)

echo.
echo ========================================
echo Tentando compilar os analisadores...
echo ========================================

echo.
echo Compilando JsonLexer...
javac JsonLexer.java
if %errorlevel% equ 0 (
    echo ✓ JsonLexer compilado com sucesso
) else (
    echo ✗ Erro na compilacao do JsonLexer
    echo Tente usar o caminho completo do Java:
    echo "C:\Program Files\Java\jdk-version\bin\javac" JsonLexer.java
    goto :end
)

echo.
echo Compilando EvalLexer...
javac EvalLexer.java
if %errorlevel% equ 0 (
    echo ✓ EvalLexer compilado com sucesso
) else (
    echo ✗ Erro na compilacao do EvalLexer
    echo Tente usar o caminho completo do Java:
    echo "C:\Program Files\Java\jdk-version\bin\javac" EvalLexer.java
    goto :end
)

echo.
echo ========================================
echo Testando os analisadores...
echo ========================================

echo.
echo Testando JsonLexer com teste_json.txt:
echo ----------------------------------------
java JsonLexer teste_json.txt
if %errorlevel% equ 0 (
    echo ✓ Teste do JsonLexer concluido
) else (
    echo ✗ Erro no teste do JsonLexer
)

echo.
echo Testando EvalLexer com teste_avaliacao.txt:
echo ----------------------------------------
java EvalLexer teste_avaliacao.txt
if %errorlevel% equ 0 (
    echo ✓ Teste do EvalLexer concluido
) else (
    echo ✗ Erro no teste do EvalLexer
)

echo.
echo ========================================
echo Instrucoes para verificar a correcao:
echo ========================================

echo.
echo Para provar que os analisadores estao corretos:
echo.
echo 1. Compare a saida com os resultados esperados no arquivo
echo    GUIA_TESTE_ANALISADORES.md
echo.
echo 2. Verifique se todos os tokens sao reconhecidos corretamente
echo.
echo 3. Confirme se as linhas sao contadas corretamente
echo.
echo 4. Teste com entradas invalidas para verificar tratamento de erros
echo.
echo 5. Compare com os requisitos do enunciado dos exercicios
echo.

:end
echo.
echo Pressione qualquer tecla para sair...
pause >nul
