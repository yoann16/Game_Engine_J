@echo off


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
mkdir temp_test_dir
cd temp_test_dir
echo cmake_minimum_required(VERSION %MIN_CMAKE_VERSION%) > CMakeLists.txt
echo project(TestVS) >> CMakeLists.txt
cmake -S . -B build_test -G "Visual Studio 17 2022" >nul 2>&1

if %errorlevel% equ 0 (
    echo Visual Studio 2022 compatible avec %MIN_CMAKE_VERSION%.
    rmdir /s /q build_test
) else (
    echo Test avec Visual Studio 2019...
    cmake -S . -B build_test -G "Visual Studio 16 2019" >nul 2>&1
    if %errorlevel% equ 0 (
        echo Visual Studio 2019 compatible avec %MIN_CMAKE_VERSION%.
        rmdir /s /q build_test
    ) else (
        echo Aucune version Visual Studio compatible trouvee.
        echo Il faut Visual Studio 2019 ou 2022 avec le workload C++.
        cd ..
        rmdir /s /q temp_test_dir
        pause
        exit /b 1
    )
)
cd ..
rmdir /s /q temp_test_dir
exit /b 0

    