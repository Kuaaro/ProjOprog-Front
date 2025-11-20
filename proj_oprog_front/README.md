# proj_oprog_front

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Prerequisites

- Flutter SDK (3.9.0 or higher)
- Dart SDK
- Chrome browser (for web development)

## Running the Frontend

### Local Development

1. Install dependencies:
```bash
flutter pub get
```

2. Run the application:
```bash
flutter run -d chrome
```

The application will open in Chrome and connect to:
- `http://localhost:3000` - Mock server (default)
- `http://localhost:5056` - Backend API (if running)

### Using Mock Server

To run with the mock API server:

```bash
cd moda_data
npm install
node mock_server.js
```

Then run Flutter:
```bash
flutter run -d chrome
```


