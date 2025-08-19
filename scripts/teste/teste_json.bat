@echo off
echo ========================================
echo Testando JsonLexer
echo ========================================

echo.
echo Verificando se o JsonLexer.java existe...

if exist ..\..\analisadores\JsonLexer\JsonLexer.java (
    echo ✓ JsonLexer.java encontrado
) else (
    echo ✗ JsonLexer.java nao encontrado
    echo Execute primeiro: java -jar jflex.jar ..\..\analisadores\JsonLexer\JsonLexer.flex
    goto :end
)

echo.
echo ========================================
echo Compilando JsonLexer...
echo ========================================

javac ..\..\analisadores\JsonLexer\JsonLexer.java
if %errorlevel% equ 0 (
    echo ✓ JsonLexer compilado com sucesso
) else (
    echo ✗ Erro na compilacao do JsonLexer
    goto :end
)

echo.
echo ========================================
echo Testando JsonLexer com JSON valido...
echo ========================================

echo.
echo Teste 1: JSON basico valido
echo ----------------------------------------
java -cp ..\..\analisadores\JsonLexer JsonLexer ..\..\dados_teste\json\teste_json.txt

echo.
echo ========================================
echo Testando JsonLexer com JSON invalido...
echo ========================================

echo.
echo Teste 2: JSON com caracteres invalidos
echo ----------------------------------------
java -cp ..\..\analisadores\JsonLexer JsonLexer ..\..\dados_teste\erro\teste_erro.txt

echo.
echo ========================================
echo Testando JsonLexer com JSON complexo...
echo ========================================

echo.
echo Teste 3: JSON complexo (se existir)
echo ----------------------------------------
if exist ..\..\dados_teste\json\test.json (
    java -cp ..\..\analisadores\JsonLexer JsonLexer ..\..\dados_teste\json\test.json
) else (
    echo Arquivo test.json nao encontrado
)

echo.
echo ========================================
echo Testes do JsonLexer concluidos!
echo ========================================

:end
echo.
echo Pressione qualquer tecla para sair...
pause >nul
