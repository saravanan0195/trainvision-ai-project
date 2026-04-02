@echo off
REM Train Vision AI - Quick Start Script for Windows

echo.
echo ╔══════════════════════════════════════════════════════╗
echo ║   🚂 Train Vision AI - Quick Start                   ║
echo ║   Real-Time Railway Control System                  ║
echo ╚══════════════════════════════════════════════════════╝
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo ✅ Node.js found: 
node --version

echo.
echo 📦 Installing frontend dependencies...
call npm install
if errorlevel 1 (
    echo ❌ Failed to install frontend dependencies
    pause
    exit /b 1
)
echo ✅ Frontend dependencies installed

echo.
echo 📦 Installing backend dependencies...
cd backend
call npm install
if errorlevel 1 (
    echo ❌ Failed to install backend dependencies
    cd ..
    pause
    exit /b 1
)
echo ✅ Backend dependencies installed
cd ..

echo.
echo ✅ All dependencies installed successfully!
echo.
echo 🚀 Next steps:
echo   1. Open TWO terminal windows
echo.
echo   Terminal 1 - Start Backend:
echo   cd backend
echo   npm run dev
echo.
echo   Terminal 2 - Start Frontend:
echo   npm run dev
echo.
echo   Then open: http://localhost:8080
echo.
pause
