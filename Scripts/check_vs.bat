@echo off

@REM echo === TEST SIMPLE ===
@REM cmake --help >nul 2>&1
@REM if %errorlevel% equ 0 (
@REM     echo CMake fonctionne
@REM ) else (
@REM     echo Problème avec CMake
@REM )

@REM echo === GENERATEURS CMAKE DISPONIBLES ===
@REM cmake --help | findstr "Visual Studio"
@REM echo ==========================================

@REM pause
@REM exit /b 0


echo ========= VERIFICATION DE VISUAL STUDIO =========
echo.
set VSWHERE_PATH="%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
set MIN_CMAKE_VERSION=3.10

if not exist %VSWHERE_PATH% (
    set VSWHERE_PATH="%ProgramFiles%\Microsoft Visual Studio\Installer\vswhere.exe"
    if not exist %VSWHERE_PATH% (
        echo Visual Studio Installer not found.
        echo Please install Visual Studio or ensure vswhere.exe is in the expected location.
        exit /b 1
    )
)
echo Visual Studio Installer found at %VSWHERE_PATH%
echo.
echo === DEBUG - Informations VS installees ===
%VSWHERE_PATH% -latest -products * -format text
echo ============================================
%VSWHERE_PATH% -latest -products * >nul 2>&1
if %errorlevel% neq 0 (
    echo Visual Studio is not installed or not found.
    echo Please install Visual Studio and ensure it is accessible from the command line.
    echo.
    pause
    exit /b 1
)
echo Visual Studio found in the PATH.
echo Test compatible with cmake...
echo cmake_minimum_required(VERSION %MIN_CMAKE_VERSION%) > CMakeLists.txt
echo project(TestVS) >> CMakeLists.txt
echo Test avec Visual Studio 2022...
cmake -S . -B temp_build_test -G "Visual Studio 17 2022" >nul 2>&1
if %errorlevel% equ 0 (
    echo Visual Studio 2022 compatible avec %MIN_CMAKE_VERSION%.
    rmdir /s /q temp_build_test
) else (
    echo Test avec Visual Studio 2019...
    cmake -S . -B temp_build_test -G "Visual Studio 16 2019" >nul 2>&1
    if %errorlevel% equ 0 (
        echo Visual Studio 2019 compatible avec %MIN_CMAKE_VERSION%.
        rmdir /s /q temp_build_test
    ) else (
        echo Aucune version Visual Studio compatible trouvee.
        echo Il faut Visual Studio 2019 ou 2022 avec le workload C++.
        del CMakeLists.txt
        pause
        exit /b 1
    )
)
del CMakeLists.txt
pause
exit /b 0

    