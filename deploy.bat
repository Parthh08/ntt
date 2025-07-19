@echo off
echo 🚀 Building NTT Center for Vercel Deployment...
echo.

echo 📦 Installing dependencies...
call flutter pub get

echo.
echo 🔨 Building web app...
call flutter build web --release

echo.
echo ✅ Build complete! 
echo.
echo 📁 Your deployment files are ready in: build\web
echo.
echo 🌐 Next steps for Vercel deployment:
echo 1. Go to https://vercel.com
echo 2. Create a new project
echo 3. Drag and drop the contents of 'build\web' folder
echo 4. Your NTT Center app will be live!
echo.
echo 🎉 Or compress the 'build\web' contents into a ZIP file for easier upload
echo.
pause
