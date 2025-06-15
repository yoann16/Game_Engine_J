@echo off

echo ========= VERIFICATION DE CMAKE =========
echo.
set MIN_CMAKE_VERSION=3.10
where cmake>nul 2>&1
if %errorlevel% neq 0 (
    echo CMake n'est pas installe ou n'est pas dans le PATH.
    echo Veuillez installer CMake et vous assurer qu'il est accessible depuis la ligne de commande.
    echo.
    pause
    exit /b 1
) 

echo CMake trouver dans le PATH.
echo Version de CMake :
cmake --version
echo.

echo Verification de la compatibiliter de la version de CMake...
echo cmake_minimum_required(VERSION %MIN_CMAKE_VERSION%) > temp_test.cmake
cmake -P temp_test.cmake >nul 2>&1
if %errorlevel% equ 0 (
    echo La version de CMake est compatible avec %MIN_CMAKE_VERSION%.
) else (
    echo La version de CMake n'est  pas compatible avec %MIN_CMAKE_VERSION%.
    echo Veuillez mettre à jour CMake vers la version %MIN_CMAKE_VERSION% ou superieure.
    echo.
    del temp_test.cmake
    pause
    exit /b 1
)
del temp_test.cmake
echo.
echo ========= CMAKE PRET A ETRE UTILISER =========
exit /b 0

    