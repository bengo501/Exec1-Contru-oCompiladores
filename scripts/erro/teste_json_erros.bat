@echo off
echo ========================================
echo Testando JsonLexer - APENAS ERROS
echo ========================================

echo.
echo Verificando se o JsonLexer.java existe...

if exist JsonLexer.java (
    echo ✓ JsonLexer.java encontrado
) else (
    echo ✗ JsonLexer.java nao encontrado
    echo Execute primeiro: java -jar jflex.jar JsonLexer.flex
    goto :end
)

echo.
echo ========================================
echo Compilando JsonLexer...
echo ========================================

javac JsonLexer.java
if %errorlevel% equ 0 (
    echo ✓ JsonLexer compilado com sucesso
) else (
    echo ✗ Erro na compilacao do JsonLexer
    goto :end
)

echo.
echo ========================================
echo TESTE DE ERROS - JsonLexer
echo ========================================
echo.
echo Os testes abaixo devem mostrar mensagens de ERRO
echo para caracteres invalidos. Isso prova que o
echo analisador esta funcionando corretamente!
echo.

echo.
echo Teste 1: JSON com caracteres especiais invalidos
echo ----------------------------------------
echo Arquivo: teste_erro.txt
java JsonLexer teste_erro.txt

echo.
echo ========================================

echo.
echo Teste 2: JSON com erros basicos
echo ----------------------------------------
echo Arquivo: json_erro.txt
if exist json_erro.txt (
    java JsonLexer json_erro.txt
) else (
    echo Arquivo json_erro.txt nao encontrado
)

echo.
echo ========================================

echo.
echo Teste 3: JSON com erros completos
echo ----------------------------------------
echo Arquivo: json_erro_completo.txt
if exist json_erro_completo.txt (
    java JsonLexer json_erro_completo.txt
) else (
    echo Arquivo json_erro_completo.txt nao encontrado
)

echo.
echo ========================================
echo RESUMO DOS TESTES DE ERRO
echo ========================================

echo.
echo ✓ Caracteres que DEVEM gerar erro:
echo   - Simbolos especiais: @ # $ %% ^ & | \ ~ `
echo   - Operadores: ^< ^> = + - (fora de contexto)
echo   - Comentarios: // /* */
echo   - Caracteres acentuados: ç ã õ é ê
echo   - Aspas nao fechadas
echo   - Numeros invalidos: .123, 12..34, 123abc
echo   - Chaves/colchetes nao balanceados
echo.
echo ✓ O que verificar:
echo   - Mensagens "ERRO: Caractere invalido"
echo   - Linha do erro correta
echo   - Continuacao do processamento apos erro
echo   - Tokens validos ainda sao reconhecidos

echo.
echo ========================================
echo Testes de erro do JsonLexer concluidos!
echo ========================================

:end
echo.
echo Pressione qualquer tecla para sair...
pause >nul
