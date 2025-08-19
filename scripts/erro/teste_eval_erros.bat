@echo off
echo ========================================
echo Testando EvalLexer - APENAS ERROS
echo ========================================

echo.
echo Verificando se o EvalLexer.java existe...

if exist EvalLexer.java (
    echo ✓ EvalLexer.java encontrado
) else (
    echo ✗ EvalLexer.java nao encontrado
    echo Execute primeiro: java -jar jflex.jar EvalLexer.flex
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
echo TESTE DE ERROS - EvalLexer
echo ========================================
echo.
echo Os testes abaixo devem mostrar mensagens de ERRO
echo para caracteres invalidos. Isso prova que o
echo analisador esta funcionando corretamente!
echo.

echo.
echo Teste 1: Entrada com caracteres especiais invalidos
echo ----------------------------------------
echo Arquivo: teste_erro.txt
java EvalLexer teste_erro.txt

echo.
echo ========================================

echo.
echo Teste 2: Entrada com erros basicos
echo ----------------------------------------
echo Arquivo: eval_erro.txt
if exist eval_erro.txt (
    java EvalLexer eval_erro.txt
) else (
    echo Arquivo eval_erro.txt nao encontrado
)

echo.
echo ========================================

echo.
echo Teste 3: Entrada com erros completos
echo ----------------------------------------
echo Arquivo: eval_erro_completo.txt
if exist eval_erro_completo.txt (
    java EvalLexer eval_erro_completo.txt
) else (
    echo Arquivo eval_erro_completo.txt nao encontrado
)

echo.
echo ========================================
echo RESUMO DOS TESTES DE ERRO
echo ========================================

echo.
echo ✓ Caracteres que DEVEM gerar erro:
echo   - Simbolos especiais: @ # $ %% ^ & | \ ~ `
echo   - Operadores: ^< ^> = != ^<= ^>= == ^<^>
echo   - Pontuacao: ; : . ? ! " '
echo   - Caracteres acentuados: ç ã õ é ê í ú á à ü
echo   - Numeros invalidos: 123.45.67, .123, 123abc
echo   - Operadores invalidos: ** // %% += -= *= /=
echo   - Parenteses nao balanceados
echo   - Unicode: → ∑ ∆ ∞ ≠
echo   - Tipos de substituicao invalidos: 3, 4, -1, 10
echo   - Nomes invalidos: 123P, P#, P-, P@
echo.
echo ✓ O que verificar:
echo   - Mensagens "ERRO: Caractere invalido"
echo   - Linha do erro correta
echo   - Continuacao do processamento apos erro
echo   - Tokens validos ainda sao reconhecidos

echo.
echo ========================================
echo Testes de erro do EvalLexer concluidos!
echo ========================================

:end
echo.
echo Pressione qualquer tecla para sair...
pause >nul
