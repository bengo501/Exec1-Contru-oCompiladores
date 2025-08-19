@echo off
echo ========================================
echo Testando EvalLexer
echo ========================================

echo.
echo Verificando se o EvalLexer.java existe...

if exist ..\..\analisadores\EvalLexer\EvalLexer.java (
    echo ✓ EvalLexer.java encontrado
) else (
    echo ✗ EvalLexer.java nao encontrado
    echo Execute primeiro: java -jar jflex.jar ..\..\analisadores\EvalLexer\EvalLexer.flex
    goto :end
)

echo.
echo ========================================
echo Compilando EvalLexer...
echo ========================================

javac EvalLexer.java
if %errorlevel% equ 0 (
    echo ✓ EvalLexer compilado com sucesso
) else (
    echo ✗ Erro na compilacao do EvalLexer
    goto :end
)

echo.
echo ========================================
echo Testando EvalLexer com entrada valida...
echo ========================================

echo.
echo Teste 1: Sistema de avaliacao basico
echo ----------------------------------------
java EvalLexer teste_avaliacao.txt

echo.
echo Teste 2: Expressoes aritmeticas
echo ----------------------------------------
java EvalLexer eval_test.txt

echo.
echo ========================================
echo Testando EvalLexer com entrada invalida...
echo ========================================

echo.
echo Teste 3: Caracteres invalidos
echo ----------------------------------------
java EvalLexer teste_erro.txt

echo.
echo ========================================
echo Testes do EvalLexer concluidos!
echo ========================================

:end
echo.
echo Pressione qualquer tecla para sair...
pause >nul
