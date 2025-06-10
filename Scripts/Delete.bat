@echo off

cd ..
if exist "build" (
    echo suppression du dossier build...
    rmdir /s/q build
) else (
    echo Aucun dossier build a supprimer.
)
echo Suppression terminee.
pause
