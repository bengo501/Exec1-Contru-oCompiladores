@echo off
echo ========================================
echo Testando Analisadores Lexicos
echo ========================================

echo.
echo Verificando se os arquivos Java foram gerados...

if exist JsonLexerExercicio.java (
    echo ✓ JsonLexerExercicio.java encontrado
) else (
    echo ✗ JsonLexerExercicio.java nao encontrado
    goto :end
)

if exist EvalLexerExercicio.java (
    echo ✓ EvalLexerExercicio.java encontrado
) else (
    echo ✗ EvalLexerExercicio.java nao encontrado
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
echo Compilando JsonLexerExercicio...
javac JsonLexerExercicio.java
if %errorlevel% equ 0 (
    echo ✓ JsonLexerExercicio compilado com sucesso
) else (
    echo ✗ Erro na compilacao do JsonLexerExercicio
    echo Tente usar o caminho completo do Java:
    echo "C:\Program Files\Java\jdk-version\bin\javac" JsonLexerExercicio.java
    goto :end
)

echo.
echo Compilando EvalLexerExercicio...
javac EvalLexerExercicio.java
if %errorlevel% equ 0 (
    echo ✓ EvalLexerExercicio compilado com sucesso
) else (
    echo ✗ Erro na compilacao do EvalLexerExercicio
    echo Tente usar o caminho completo do Java:
    echo "C:\Program Files\Java\jdk-version\bin\javac" EvalLexerExercicio.java
    goto :end
)

echo.
echo ========================================
echo Testando os analisadores...
echo ========================================

echo.
echo Testando JsonLexerExercicio com teste_json.txt:
echo ----------------------------------------
java JsonLexerExercicio teste_json.txt
if %errorlevel% equ 0 (
    echo ✓ Teste do JsonLexerExercicio concluido
) else (
    echo ✗ Erro no teste do JsonLexerExercicio
)

echo.
echo Testando EvalLexerExercicio com teste_avaliacao.txt:
echo ----------------------------------------
java EvalLexerExercicio teste_avaliacao.txt
if %errorlevel% equ 0 (
    echo ✓ Teste do EvalLexerExercicio concluido
) else (
    echo ✗ Erro no teste do EvalLexerExercicio
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
