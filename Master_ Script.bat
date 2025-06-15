@echo off
echo ========= VERIFICATION COMPLETE DE L'ENVIRONNEMENT =========
echo.
::verification de git...
call Scripts\check_git.bat 
if %errorlevel% neq 0 (
    echo erreur lors de la verification de Git.
    pause
    exit /b 1
)
echo  Git OK
echo.
:: verification de cmake...
call Scripts\check_cmake.bat 
if %errorlevel% neq 0 (
    echo erreur lors de la verification de CMake.
    pause
    exit /b 1
)
echo  cmake OK
echo.
:: verification de Visual Studio...
call Scripts\check_vs.bat 
if %errorlevel% neq 0 (
    echo erreur lors de la verification de Visual Studio.
    pause
    exit /b 1
)
echo  Visual Studio OK
echo.

echo ========= LANCEMENT DU BUILD =========
echo.

call Scripts\build.bat 
if %errorlevel% neq 0 (
    echo erreur lors du build.
    pause
    exit /b 1
)
echo ========= BUILD TERMINE AVEC SUCCES =========
echo.
pause
exit /b 0
