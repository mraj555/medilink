# Medilink

Medilink is a Flutter-based healthcare application scaffold focused on doctor discovery and video consultation workflows. The repository is organized to separate app bootstrapping, screen UI, domain models, and third-party communication configuration so the codebase remains easy to extend.

## Tech Stack

- Flutter SDK with Dart
- Material Design UI framework
- ZEGOCLOUD UIKit for chat/call UI primitives
- ZEGOCLOUD prebuilt call package for video-call experiences
- Android and iOS platform support
- Flutter testing support via flutter_test

## Architecture Overview

The project follows a simple layered structure:

1. App bootstrap layer
   - The entry point in lib/main.dart creates the app instance and defines the initial screen.
   - This file is the top-level wiring point for the application.

2. Presentation layer
   - UI screens live under lib/screens/.
   - Home and call flows are intended to be implemented as dedicated screen widgets and route targets.

3. Domain/data layer
   - The model layer in lib/models/ holds the core business entities.
   - Doctor data is represented as a strongly typed Dart model for use across screens.

4. Integration/configuration layer
   - Shared configuration and third-party SDK values are kept in lib/utils/.
   - Zego credentials and app identifiers are expected to be centralized here for easier maintenance.

## Project Structure

```text
lib/
  main.dart                  # App entry point and root widget setup
  models/
    doctor.dart              # Doctor domain model
  screens/
    home_screen.dart         # Home/doctor discovery screen placeholder
    call_screen.dart         # Video consultation screen placeholder
  utils/
    zego_config.dart         # ZEGOCLOUD configuration constants
android/                     # Android-specific build and manifest files
ios/                         # iOS-specific build and app configuration
test/
  widget_test.dart           # Basic widget test scaffold
```

## File-to-File Connections

- lib/main.dart
  - Boots the app with MaterialApp.
  - Acts as the top-level entry point for all screen navigation and theming.

- lib/screens/home_screen.dart
  - Intended to host the main user-facing doctor discovery or dashboard experience.
  - This is the natural place to render doctor lists or selection flows.

- lib/screens/call_screen.dart
  - Intended to host the active consultation experience.
  - This screen is the likely integration point for video-call UI components.

- lib/models/doctor.dart
  - Provides the data contract for doctor information such as name, specialty, rating, experience, and availability.
  - Any screen that needs doctor details should consume this model.

- lib/utils/zego_config.dart
  - Centralizes platform values used by the ZEGOCLOUD SDK.
  - Keeping credentials and identifiers here reduces scattered configuration and simplifies future environment-specific changes.

## Current Structure Notes

The repository currently contains the foundational Flutter structure and the intended feature boundaries, but the UI screens are still placeholders. The architecture is set up so a developer can implement the app flow by connecting the screens to the shared model and ZEGOCLOUD configuration layer.

## Development Conventions

- Keep UI code inside lib/screens/.
- Keep reusable data structures in lib/models/.
- Keep external SDK settings and shared constants in lib/utils/.
- Keep app-wide bootstrapping and navigation logic in lib/main.dart.
- Prefer small, focused widgets and clear separation between UI and business data.
