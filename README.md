# 🕌 Islamic Dua App

A beautiful Flutter application for daily Islamic duas (prayers), dhikr counter, and prayer reminders with support for Bengali, English, and Arabic languages.

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)

## ✨ Features

- 📖 **Daily Duas** - Collection of authentic Islamic prayers with Arabic text, transliteration, and translations
- 🔢 **Dhikr Counter** - Digital tasbih counter with vibration feedback and customizable targets
- ⏰ **Prayer Reminders** - Schedule daily/weekly notifications for duas
- 🌐 **Multi-language** - Bengali, English, and Arabic support
- 💾 **Offline Access** - SQLite database for local data storage
- 🎨 **Clean UI** - Modern and intuitive Islamic-themed interface

## 📋 Prerequisites

Before you begin, ensure you have installed:

- **Flutter SDK** (3.0 or higher) - [Download here](https://flutter.dev/docs/get-started/install)
- **Android Studio** or **VS Code** with Flutter extensions
- **Git** - [Download here](https://git-scm.com/downloads)

## 🚀 Quick Start

### 1️⃣ Clone the Repository
```bash
git clone [https://github.com/Parbaz-Hossain/islamic-dua-app.git](https://github.com/Parbaz-Hossain/islamic_dua_app)
cd islamic-dua-app
2️⃣ Install Dependencies
flutter pub get
3️⃣ Create Assets Folder
mkdir -p assets/fonts assets/images assets/audio
4️⃣ Download Arabic Font
Download Amiri font from Google Fonts and place the .ttf files in assets/fonts/:

Amiri-Regular.ttf
Amiri-Bold.ttf

5️⃣ Run the App
# Check connected devices
flutter devices

# Run on connected device/emulator
flutter run

## 🛠️ Tech Stack

### Frontend & UI
- **Flutter** - Cross-platform mobile & web framework
- **Google Fonts** - Beautiful typography with Arabic support

### State & Data
- **Provider** - Lightweight state management
- **SQLite** - Persistent local storage

### Features
- **Flutter Local Notifications** - Smart prayer reminders
- **Timezone** - Accurate prayer time scheduling

📱 Supported Platforms
✅ Android (6.0+)
✅ iOS (13.0+)
✅ Web
✅ Windows
✅ Linux
✅ macOS

🔧 Build Commands
# Debug build
flutter run --debug

# Release APK (Android)
flutter build apk --release

# Release App Bundle (Android)
flutter build appbundle --release

# iOS build
flutter build ios --release

📁 Project Structure
lib/
├── core/             # Constants, themes, utilities
├── models/           # Data models (Dua, Reminder)
├── screens/          # UI screens
├── widgets/          # Reusable widgets
├── services/         # Business logic & database
└── main.dart         # Entry point

🐛 Troubleshooting
Issue: "Flutter command not found"
# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"
Issue: "No connected devices"
# List available emulators
flutter emulators
# Launch emulator
flutter emulators --launch <emulator_id>

Issue: Android licenses
flutter doctor --android-licenses

🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

🙏 Acknowledgments
Arabic font: Amiri by Google Fonts
Islamic content sources from authentic hadith collections

📞 Support
For issues and questions:

Open an Issue
Email: md.parvezcse@gmail.com


Made with ❤️ for the Muslim community
