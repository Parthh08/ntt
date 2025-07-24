@echo off
echo 🚀 Seeds to Shine Academy - Manual Deployment Guide
echo.
echo ⚠️  Git Authentication Issue Detected!
echo The current Git credentials are for 'devilking2601' but your repo is 'Parthh08/ntt'
echo.
echo 🔧 SOLUTION OPTIONS:
echo.
echo === OPTION 1: Fix Git Authentication ===
echo 1. Open Windows Credential Manager (search "Credential Manager")
echo 2. Go to "Windows Credentials"
echo 3. Find "git:https://github.com" entries
echo 4. Delete all GitHub-related credentials
echo 5. Run: git push origin main
echo 6. Enter your Parthh08 GitHub username and password/token
echo.
echo === OPTION 2: Use GitHub Desktop (Easiest) ===
echo 1. Download GitHub Desktop from: https://desktop.github.com/
echo 2. Sign in with your Parthh08 account
echo 3. Clone your repository
echo 4. Copy the updated files to the cloned folder
echo 5. Commit and push through GitHub Desktop
echo.
echo === OPTION 3: Manual Upload ===
echo 1. Go to: https://github.com/Parthh08/ntt
echo 2. Click "Upload files"
echo 3. Drag all files from this folder
echo 4. Commit changes
echo.
echo === OPTION 4: Use Personal Access Token ===
echo 1. Go to GitHub Settings → Developer settings → Personal access tokens
echo 2. Generate new token with repo permissions
echo 3. Use token as password when pushing
echo.
echo 📁 Your simplified app is ready in the 'build/web' folder!
echo 🌐 Once uploaded, enable GitHub Pages in repository settings.
echo.
pause
