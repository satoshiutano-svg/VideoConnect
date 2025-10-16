@echo off
:: === CONFIGURE YOUR INFO ===
set "PROJECT_PATH=C:\Users\Ulfat Khan\Documents\Coding\VideoConnect\VideoConnect"
set "REPO_URL=https://github.com/satoshiutano-svg/VideoConnect.git"
set "COMMIT_MSG=Auto upload from batch file"

:: === DO NOT EDIT BELOW ===
echo.
echo === Uploading Project to GitHub ===
cd /d "%PROJECT_PATH%" || (echo Project path not found. && pause && exit /b)

if not exist .git (
    echo Initializing new git repository...
    git init
)

echo Adding all files...
git add -A

echo Committing changes...
git commit -m "%COMMIT_MSG%" 2>nul

echo Setting remote repository...
git remote remove origin 2>nul
git remote add origin "%REPO_URL%"

echo Renaming branch to main...
git branch -M main

echo Pushing to GitHub...
git push -u origin main

echo.
echo === Upload Complete ===
pause
