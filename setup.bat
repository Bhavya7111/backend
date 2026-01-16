@echo off
echo ====================================
echo DevOps Practice Project Setup
echo ====================================
echo.

REM Create folder structure
echo Creating project structure...
mkdir frontend\src frontend\public
mkdir backend\src
mkdir kubernetes\dev kubernetes\qa kubernetes\uat kubernetes\prod
mkdir scripts
mkdir .github\workflows

echo.
echo Project structure created!
echo.
echo Next steps will be provided...
echo.
pause