# Chattero 💬

A modern, real-time chat application built with Flutter and Firebase.

[![Flutter](https://img.shields.io/badge/Flutter-3.19.0-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.1.2-blue.svg)](https://dart.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-11.6.8-orange.svg)](https://firebase.google.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 📱 Features

- **Real-time Messaging**: Instant message delivery using Firebase Firestore
- **User Authentication**: Secure login and registration with Firebase Auth
- **Image Sharing**: Send and receive images in chat conversations
- **Push Notifications**: Real-time notifications for new messages
- **Modern UI**: Beautiful Material Design 3 interface with Google Fonts
- **Cross-platform**: Works on iOS, Android, Web, and Desktop

## 🚀 Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (3.19.0 or higher)
- [Dart](https://dart.dev/get-dart) (3.1.2 or higher)
- [Firebase](https://firebase.google.com/) account
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/chattero.git
   cd chattero
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Follow the detailed setup guide in [SETUP.md](SETUP.md)
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Authentication (Email/Password)
   - Enable Firestore Database
   - Enable Storage
   - Enable Cloud Messaging
   - Download and add the configuration files:
     - `google-services.json` to `android/app/`
     - `GoogleService-Info.plist` to `ios/Runner/`
   - Copy `lib/firebase_options_template.dart` to `lib/firebase_options.dart` and configure with your Firebase settings

4. **Run the application**
   ```bash
   flutter run
   ```

## 🛠️ Tech Stack

- **Frontend**: Flutter, Dart
- **Backend**: Firebase
- **Authentication**: Firebase Auth
- **Database**: Cloud Firestore
- **Storage**: Firebase Storage
- **Notifications**: Firebase Cloud Messaging
- **UI**: Material Design 3, Google Fonts

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── firebase_options.dart     # Firebase configuration
├── screens/
│   ├── auth.dart            # Authentication screen
│   ├── chat.dart            # Main chat screen
│   └── splash.dart          # Loading screen
└── widgets/
    ├── chat_messages.dart   # Messages list widget
    ├── message_bubble.dart  # Individual message widget
    ├── new_message.dart     # Message input widget
    └── user_image.dart      # User image widget
```

## 🔧 Configuration

### Firebase Configuration

1. **Follow the Setup Guide**: See [SETUP.md](SETUP.md) for detailed Firebase configuration instructions
2. **Authentication**: Enable Email/Password sign-in method
3. **Firestore**: Create a collection named `messages` with the following structure:
   ```json
   {
     "text": "string",
     "createdAt": "timestamp",
     "userId": "string",
     "userName": "string",
     "userImage": "string"
   }
   ```
4. **Storage**: Set up rules for image uploads
5. **Messaging**: Configure FCM for push notifications

### Environment Variables

Create a `.env` file in the root directory (optional):
```env
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_API_KEY=your-api-key
```

## 🚀 Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev/) for the amazing framework
- [Firebase](https://firebase.google.com/) for the backend services
- [Google Fonts](https://fonts.google.com/) for beautiful typography
- [Material Design](https://material.io/) for design guidelines

---

**Made with ❤️ using Flutter and Firebase**
