@echo off
echo ========================================
echo SISTEMA DE TESTES DOS ANALISADORES LEXICOS
echo ========================================

echo.
echo Estrutura do projeto organizada:
echo.
echo 📁 analisadores/
echo   ├── JsonLexer/     (JsonLexer.flex, JsonLexer.java, JsonLexer.class)
echo   └── EvalLexer/     (EvalLexer.flex, EvalLexer.java, EvalLexer.class)
echo.
echo 📁 scripts/
echo   ├── teste/         (teste_json.bat, teste_eval.bat)
echo   ├── erro/          (teste_json_erros.bat, teste_eval_erros.bat)
echo   └── completo/      (teste_completo.bat, teste_todos_erros.bat)
echo.
echo 📁 dados_teste/
echo   ├── json/          (arquivos de teste JSON)
echo   ├── eval/          (arquivos de teste EvalLexer)
echo   └── erro/          (arquivos de teste de erro)
echo.
echo 📁 documentacao/     (guias e resumos)
echo.

echo ========================================
echo OPCOES DE TESTE DISPONIVEIS:
echo ========================================

echo.
echo 1. Testes individuais:
echo    - scripts\teste\teste_json.bat
echo    - scripts\teste\teste_eval.bat
echo.
echo 2. Testes de erro:
echo    - scripts\erro\teste_json_erros.bat
echo    - scripts\erro\teste_eval_erros.bat
echo.
echo 3. Testes completos:
echo    - scripts\completo\teste_completo.bat
echo    - scripts\completo\teste_todos_erros.bat
echo    - scripts\completo\testar_analisadores.bat
echo.

echo ========================================
echo INSTRUCOES DE USO:
echo ========================================

echo.
echo 1. Primeiro, gere os arquivos Java:
echo    java -jar jflex.jar analisadores\JsonLexer\JsonLexer.flex
echo    java -jar jflex.jar analisadores\EvalLexer\EvalLexer.flex
echo.
echo 2. Execute um dos scripts de teste:
echo    scripts\teste\teste_json.bat
echo    scripts\erro\teste_json_erros.bat
echo    scripts\completo\teste_completo.bat
echo.
echo 3. Consulte a documentacao:
echo    documentacao\GUIA_TESTES.md
echo    documentacao\RESUMO_TESTES_ERRO.md
echo.

echo ========================================
echo EXECUTANDO TESTE RAPIDO...
echo ========================================

echo.
echo Verificando se os arquivos Java existem...

if exist analisadores\JsonLexer\JsonLexer.java (
    echo ✓ JsonLexer.java encontrado
) else (
    echo ✗ JsonLexer.java nao encontrado
    echo Execute: java -jar jflex.jar analisadores\JsonLexer\JsonLexer.flex
    goto :menu
)

if exist analisadores\EvalLexer\EvalLexer.java (
    echo ✓ EvalLexer.java encontrado
) else (
    echo ✗ EvalLexer.java nao encontrado
    echo Execute: java -jar jflex.jar analisadores\EvalLexer\EvalLexer.flex
    goto :menu
)

echo.
echo Compilando analisadores...

javac analisadores\JsonLexer\JsonLexer.java
if %errorlevel% neq 0 (
    echo ✗ Erro na compilacao do JsonLexer
    goto :menu
)

javac analisadores\EvalLexer\EvalLexer.java
if %errorlevel% neq 0 (
    echo ✗ Erro na compilacao do EvalLexer
    goto :menu
)

echo ✓ Ambos os analisadores compilados com sucesso!

echo.
echo ========================================
echo TESTE RAPIDO - AMBOS ANALISADORES
echo ========================================

echo.
echo Testando JsonLexer...
java -cp analisadores\JsonLexer JsonLexer dados_teste\json\teste_json.txt

echo.
echo Testando EvalLexer...
java -cp analisadores\EvalLexer EvalLexer dados_teste\eval\teste_avaliacao.txt

echo.
echo ========================================
echo TESTE RAPIDO CONCLUIDO!
echo ========================================

:menu
echo.
echo ========================================
echo MENU DE OPCOES:
echo ========================================

echo.
echo 1. Executar teste completo (válidos + erros)
echo 2. Executar apenas testes de erro
echo 3. Executar teste individual JsonLexer
echo 4. Executar teste individual EvalLexer
echo 5. Ver documentacao
echo 6. Sair
echo.

set /p escolha="Escolha uma opcao (1-6): "

if "%escolha%"=="1" (
    echo.
    echo Executando teste completo...
    scripts\completo\teste_completo.bat
    goto :menu
)

if "%escolha%"=="2" (
    echo.
    echo Executando testes de erro...
    scripts\completo\teste_todos_erros.bat
    goto :menu
)

if "%escolha%"=="3" (
    echo.
    echo Executando teste JsonLexer...
    scripts\teste\teste_json.bat
    goto :menu
)

if "%escolha%"=="4" (
    echo.
    echo Executando teste EvalLexer...
    scripts\teste\teste_eval.bat
    goto :menu
)

if "%escolha%"=="5" (
    echo.
    echo Abrindo documentacao...
    echo.
    echo Arquivos de documentacao disponiveis:
    echo - documentacao\GUIA_TESTES.md
    echo - documentacao\RESUMO_TESTES.md
    echo - documentacao\RESUMO_TESTES_ERRO.md
    echo - documentacao\GUIA_TESTE_ANALISADORES.md
    echo.
    echo Abra esses arquivos em um editor de texto para ver as instrucoes.
    goto :menu
)

if "%escolha%"=="6" (
    echo.
    echo Saindo...
    goto :end
)

echo.
echo Opcao invalida! Escolha de 1 a 6.
goto :menu

:end
echo.
echo Pressione qualquer tecla para sair...
pause >nul
