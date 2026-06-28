# Medilink

Medilink is a Flutter-based healthcare application scaffold for doctor discovery and remote consultation experiences. The codebase is structured to keep the app entry point, screen UI, domain models, and third-party communication configuration separated so future development remains easy to follow.

## Tech Stack

- Flutter SDK with Dart
- Material Design widgets and theming
- ZEGOCLOUD UIKit for reusable communication UI building blocks
- ZEGOCLOUD prebuilt call package for video consultation flows
- Android and iOS platform support
- Flutter test framework for widget and app-level validation

## Architecture Overview

The application is organized in four clear layers:

1. App bootstrap layer
   - The entry point in lib/main.dart initializes the app and defines the root widget tree.
   - This file is the top-level place for app-wide themes, routing setup, and initial screen selection.

2. Presentation layer
   - Screen-specific UI lives in lib/screens/.
   - Home and call experience flows are intended to be implemented as dedicated widgets and route targets.
   - This layer is responsible for rendering information to the user and collecting interaction events.

3. Domain layer
   - The model layer in lib/models/ contains the core business entities used across the app.
   - Doctor-related data is represented with a typed Dart model so screens can consume consistent data.

4. Integration and configuration layer
   - Shared SDK settings and constants live in lib/utils/.
   - ZEGOCLOUD service values and app identifiers should remain centralized here to reduce duplication and make future changes safer.

### High-Level Flow

```text
User Interaction
  -> Screen Widget (lib/screens/)
  -> Domain Model (lib/models/)
  -> Shared Configuration / SDK Layer (lib/utils/)
  -> Native Platform Layer (Android/iOS)
```

## Project Structure

```text
lib/
  main.dart                  # App entry point and root widget setup
  models/
    doctor.dart              # Doctor domain model
  screens/
    home_screen.dart         # Home/doctor discovery screen placeholder
    call_screen.dart         # Consultation/call screen placeholder
  utils/
    zego_config.dart         # ZEGOCLOUD configuration constants
android/                     # Android-specific build, manifests, and Gradle files
ios/                         # iOS-specific build and app configuration
test/
  widget_test.dart           # Basic widget test scaffold
```

## File-to-File Connections

- lib/main.dart
  - Boots the app with MaterialApp.
  - Acts as the main wiring point for the application shell and future navigation setup.

- lib/screens/home_screen.dart
  - Intended to host the primary doctor discovery or dashboard experience.
  - This is the natural place to render doctor lists, search, or selection UI.

- lib/screens/call_screen.dart
  - Intended to host the active consultation experience.
  - This screen is the likely integration point for video-call UI components and call lifecycle handling.

- lib/models/doctor.dart
  - Provides the data contract for doctor information such as name, specialty, rating, experience, and availability.
  - Any future screen that needs doctor detail data should consume this model rather than defining its own structure.

- lib/utils/zego_config.dart
  - Centralizes configuration values used by the ZEGOCLOUD SDK.
  - Keeping SDK identifiers and credentials in one place makes it easier to manage environment-specific values.

## Development Conventions

- Keep UI components inside lib/screens/.
- Keep reusable business data structures inside lib/models/.
- Keep SDK settings, shared constants, and environment-specific values inside lib/utils/.
- Keep app-wide bootstrapping, theming, and navigation logic inside lib/main.dart.
- Prefer focused widgets and keep screen logic separate from data modeling.

## Where New Features Should Go

- New user-facing flows should be added as new screens under lib/screens/.
- New domain entities should be added under lib/models/.
- New SDK or platform integrations should be isolated in lib/utils/ or platform-specific folders.
- New tests should be added under test/ so behavior remains verifiable as the app grows.
