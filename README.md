# Flutter Simple Camera

[![Flutter](https://img.shields.io/badge/Flutter-Framework-blue.svg)](https://flutter.dev/)

A simple Flutter application demonstrating the use of the camera and image picker plugins to capture and select images. This project is a basic implementation for those who want to quickly integrate camera functionality into their Flutter apps.

## Features

- **Capture Images**: Take photos using the device's camera.
- **Select Images**: Pick images from the device's gallery.
- **Preview Images**: Display the captured or selected image in the app.
- **Platform Support**: Works on both Android and iOS devices.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install) (version 2.0 or higher recommended)
- Dart: Flutter uses Dart, which is included in the Flutter SDK.
- A working Android/iOS emulator or a physical device.

### Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/vijarp/flutter_simple_camera.git
    cd flutter_simple_camera
    ```

2. **Install dependencies**:

    ```bash
    flutter pub get
    ```

3. **Run the app**:

    - For Android:
      ```bash
      flutter run
      ```
    - For iOS:
      ```bash
      flutter run
      ```

### Directory Structure

```plaintext
flutter_simple_camera/
├── android/          # Android-specific code and resources
├── ios/              # iOS-specific code and resources
├── lib/              # Dart files for the app
│   ├── main.dart     # Main entry point for the application
│   └── camera_page.dart # Camera and gallery selection logic
├── pubspec.yaml      # Dependencies and project metadata
└── README.md         # Project README file

