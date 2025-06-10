@echo off
:: Script de buil pour Game_Engine_J
cd ..
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
pause 
exit /b 0
:: Fin du script de build