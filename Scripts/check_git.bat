@echo off

echo ========= VERIFICATION DE GIT =========
echo.
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo Git n'est pas installer ou n'est pas dans le PATH.
    echo Veuillez installer Git et vous assurer qu'il est accessible depuis la ligne de commande.
    echo.
    pause
    exit /b 1

)
echo Git trouver dans le PATH.
echo.
echo ========= GIT PRET A ETRE UTILISER =========
exit /b 0


    