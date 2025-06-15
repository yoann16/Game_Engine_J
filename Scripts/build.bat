@echo off
:: Script de buil pour Game_Engine_J
if not exist "build" (
    mkdir build
)
cd build
echo Configuration du projet...
cmake ..
echo Compilation du projet...
cmake --build .
echo Build termine.
cd ..
exit /b 0
:: Fin du script de build