# Monitoring Pekerjaan App (with combined CI)

Project includes:
- Debug APK build (artifact: monitoring-app-debug-apk)
- Optional Signed Release APK build (artifact: monitoring-app-release-apk) if you provide keystore as GitHub Secret

## How to get signed release automatically
1. Create a keystore (if you don't have):
   ```bash
   keytool -genkey -v -keystore my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias
   ```
2. Encode the keystore to base64 and add to GitHub Secrets:
   ```bash
   base64 my-release-key.jks > keystore.base64.txt
   # copy the content and add as secret KEYSTORE_BASE64
   ```
3. In your GitHub repo settings → Secrets → Actions, add these secrets:
   - `KEYSTORE_BASE64` : (contents of keystore.base64.txt)
   - `KEYSTORE_PASSWORD` : ASM2020
   - `KEY_ALIAS` : PT ADAM SUKSES MANDIRI (e.g., my-key-PT ADAM SUKSES MANDIRI)
   - `KEY_PASSWORD` : ASM2020 (often same as keystore password)

Once secrets are added, pushing to `main` will run both jobs; the release job runs only if `KEYSTORE_BASE64` secret is present.

## Usage
- Upload this project to GitHub (include `.github/workflows/android-build.yml`).
- In Actions tab, run the workflow or push changes.
- After success, download artifacts:
  - `monitoring-app-debug-apk` (debug apk)
  - `monitoring-app-release-apk` (signed release apk, only if secrets provided)
