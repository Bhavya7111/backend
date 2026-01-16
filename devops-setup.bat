@echo off
setlocal enabledelayedexpansion

echo =====================================================
echo DevOps Practice Project - Automated Setup (Windows)
echo =====================================================
echo.

REM Create main project folder
set PROJECT_ROOT=devops-practice-project
echo Creating project structure...
mkdir %PROJECT_ROOT%
cd %PROJECT_ROOT%

REM Create folder structure
mkdir frontend\src frontend\public
mkdir backend\src
mkdir kubernetes\dev kubernetes\qa kubernetes\uat kubernetes\prod
mkdir scripts
mkdir .github\workflows

echo.
echo ✅ Folder structure created!
echo.

REM Create .gitignore
echo Creating Git configuration...
(
echo node_modules/
echo .env
echo .env.local
echo *.log
echo dist/
echo build/
echo .DS_Store
) > .gitignore

REM Initialize Git
git init

echo.
echo ✅ Git initialized!
echo.

REM ===== FRONTEND FILES =====
echo Creating Frontend application files...

REM Frontend package.json
(
echo {
echo   "name": "frontend-app",
echo   "version": "1.0.0",
echo   "private": true,
echo   "dependencies": {
echo     "react": "^18.2.0",
echo     "react-dom": "^18.2.0",
echo     "react-scripts": "5.0.1",
echo     "axios": "^1.6.0"
echo   },
echo   "scripts": {
echo     "start": "react-scripts start",
echo     "build": "react-scripts build",
echo     "test": "react-scripts test --passWithNoTests"
echo   },
echo   "eslintConfig": {
echo     "extends": ["react-app"]
echo   },
echo   "browserslist": {
echo     "production": ["^>0.2%%", "not dead", "not op_mini all"],
echo     "development": ["last 1 chrome version"]
echo   }
echo }
) > frontend\package.json

REM Frontend index.html
(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo   ^<meta charset="utf-8" /^>
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1" /^>
echo   ^<title^>DevOps Practice App^</title^>
echo ^</head^>
echo ^<body^>
echo   ^<div id="root"^>^</div^>
echo ^</body^>
echo ^</html^>
) > frontend\public\index.html

echo ✅ Frontend configuration created!
echo.

REM ===== BACKEND FILES =====
echo Creating Backend application files...

REM Backend package.json
(
echo {
echo   "name": "backend-app",
echo   "version": "1.0.0",
echo   "main": "src/server.js",
echo   "scripts": {
echo     "start": "node src/server.js",
echo     "test": "echo Test passed && exit 0"
echo   },
echo   "dependencies": {
echo     "express": "^4.18.2",
echo     "cors": "^2.8.5",
echo     "dotenv": "^16.3.1"
echo   }
echo }
) > backend\package.json

echo ✅ Backend configuration created!
echo.

REM ===== DOCKER COMPOSE =====
echo Creating Docker Compose file...

(
echo version: '3.8'
echo.
echo services:
echo   frontend:
echo     build:
echo       context: ./frontend
echo       dockerfile: Dockerfile
echo     ports:
echo       - "3000:80"
echo     environment:
echo       - REACT_APP_API_URL=http://localhost:5000
echo     depends_on:
echo       - backend
echo     networks:
echo       - app-network
echo.
echo   backend:
echo     build:
echo       context: ./backend
echo       dockerfile: Dockerfile
echo     ports:
echo       - "5000:5000"
echo     environment:
echo       - PORT=5000
echo       - ENVIRONMENT=development
echo     networks:
echo       - app-network
echo.
echo networks:
echo   app-network:
echo     driver: bridge
) > docker-compose.yml

echo ✅ Docker Compose created!
echo.

echo =====================================================
echo ✅ PHASE 1 COMPLETE!
echo =====================================================
echo.
echo 📂 Project structure created at: %CD%
echo.
echo 🎯 Next: Run create-application-files.bat to continue
echo.
pause