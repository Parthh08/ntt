# 🚀 NTT Center - Vercel Deployment Guide

## Method 1: Drag & Drop Deployment (Easiest)

### Step 1: Prepare Your Files
1. Navigate to the `build/web` folder in your project
2. Select ALL files and folders inside `build/web` (not the web folder itself)
3. Create a ZIP file with all these contents

### Step 2: Deploy to Vercel
1. Go to [vercel.com](https://vercel.com) and sign up/login
2. Click "New Project"
3. Choose "Browse all templates" and then "Other"
4. Click "Deploy" without connecting to Git
5. Drag and drop your ZIP file or the contents of `build/web` folder
6. Your app will be deployed instantly!

## Method 2: Git Integration (Recommended for Updates)

### Step 1: Create vercel.json Configuration
```json
{
  "buildCommand": "flutter build web --release",
  "outputDirectory": "build/web",
  "installCommand": "flutter pub get"
}
```

### Step 2: Push to GitHub
1. Create a GitHub repository
2. Push your Flutter project to GitHub

### Step 3: Connect to Vercel
1. Go to vercel.com and import your GitHub repository
2. Vercel will automatically detect it's a Flutter project
3. Deploy!

## 📁 Files to Deploy (Drag & Drop)

From the `build/web` folder, you need these files:
- `index.html` (main entry point)
- `main.dart.js` (compiled Flutter code)
- `flutter.js` & `flutter_bootstrap.js` (Flutter runtime)
- `assets/` folder (all your app assets)
- `canvaskit/` folder (Flutter rendering engine)
- `icons/` folder (app icons)
- `manifest.json` (PWA configuration)
- `favicon.png` (website icon)
- Other supporting files

## 🌐 Custom Domain (Optional)
Once deployed, you can:
1. Go to your project settings on Vercel
2. Add a custom domain
3. Point your domain's DNS to Vercel

## 🔧 Environment Variables (If Needed)
If your app needs environment variables:
1. Go to Project Settings → Environment Variables
2. Add any required variables

## ✅ Deployment Checklist
- [x] Flutter web build completed successfully
- [ ] All files from `build/web` folder ready
- [ ] Vercel account created
- [ ] Files uploaded to Vercel
- [ ] Deployment successful
- [ ] App tested on live URL

## 🎉 Your NTT Center App Features
- ✨ Beautiful animations and interactive UI
- 📞 One-tap calling (7000xxxxxx)
- 📧 Direct email integration
- 🗺️ Google Maps integration for location
- 📱 Responsive design for all devices
- 🎨 Modern gradient design with NTT branding

Your app will be live at: `https://your-project-name.vercel.app`
