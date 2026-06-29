# Medilink

Medilink is a Flutter healthcare app scaffold for doctor discovery and remote consultation. It is designed so developers can extend the app with new screens, business models, and third-party communications while keeping the core structure easy to navigate.

## Tech Stack

- Flutter SDK (Dart)
- Material Design UI and theming
- ZEGOCLOUD UIKit (`zego_uikit`) for communication UI components
- ZEGOCLOUD prebuilt call package (`zego_uikit_prebuilt_call`) for video consultation flows
- Android and iOS platform support
- Flutter test support via `flutter_test`

## Architecture Overview

The app follows a modular layer-based architecture:

1. **Bootstrap / App shell**
   - `lib/main.dart` initializes the Flutter application.
   - This file is responsible for the root `MaterialApp`, theme setup, and the first route.

2. **Presentation layer**
   - UI screens live in `lib/screens/`.
   - Each screen should represent a distinct user flow, such as doctor selection or an active call.
   - Screens should consume data models and pass user actions to the next layer.

3. **Domain / data layer**
   - Core entities live in `lib/models/`.
   - `Doctor` is the current primary domain model and describes doctor profile data.

4. **Integration / configuration layer**
   - Shared SDK constants and configuration values live in `lib/utils/`.
   - `ZegoConfig` holds ZEGOCLOUD app credentials so SDK integration is centralized.

### Runtime Flow

```text
App start
  -> lib/main.dart
  -> selected screen in lib/screens/
  -> data consumed from lib/models/
  -> SDK config sourced from lib/utils/
  -> native Android/iOS platform implementation
```

## Project Structure

```text
lib/
  main.dart                  # App entry point and root widget
  models/
    doctor.dart              # Doctor domain model
  screens/
    home_screen.dart         # Doctor discovery / home screen placeholder
    call_screen.dart         # Consultation / call screen placeholder
  utils/
    zego_config.dart         # ZEGOCLOUD configuration constants
android/                     # Android-specific configuration and Gradle setup
ios/                         # iOS-specific Xcode and build configuration
test/
  widget_test.dart           # Default widget test scaffold
```

## Detailed File Map

- `lib/main.dart`
  - Current entry point that creates `MaterialApp` and sets the initial home page.
  - Future work: replace the placeholder home page with an app shell or route-based navigation.

- `lib/screens/home_screen.dart`
  - Intended to display doctor listings, search, or dashboard UI.
  - Should be the first screen users see in the app flow.

- `lib/screens/call_screen.dart`
  - Intended to host the video consultation interface and call flow.
  - Should integrate with ZEGOCLOUD call widgets and lifecycle methods.

- `lib/models/doctor.dart`
  - Defines the `Doctor` class with fields for `id`, `name`, `speciality`, `imageUrl`, `rating`, `experience`, and `isAvailable`.
  - Use this model for any doctor-related state or presentation data.

- `lib/utils/zego_config.dart`
  - Stores ZEGOCLOUD constants like `appID` and `appSign`.
  - Centralizing credentials here simplifies integration and future environment handling.

- `android/` and `ios/`
  - Contain native build, manifest, and platform-specific configuration.
  - These folders are managed by Flutter but may require manual changes for native SDK setup or permissions.

- `test/widget_test.dart`
  - Basic Flutter widget test scaffold to verify app widgets and behavior.

## File Connections and Extension Points

- `main.dart` should wire the app into `home_screen.dart` and later route to `call_screen.dart`.
- `home_screen.dart` should render doctor data using `Doctor` from `models/doctor.dart`.
- `call_screen.dart` should use `ZegoConfig` from `utils/zego_config.dart` to initialize ZEGOCLOUD call sessions.
- Adding new flows should usually mean adding a new file under `lib/screens/` and a matching model under `lib/models/` if new domain data is required.

## Development Notes

- Keep UI logic in `lib/screens/` and avoid placing large business rules there.
- Keep reusable data types in `lib/models/` so screens stay consistent.
- Keep third-party SDK constants and shared app values in `lib/utils/`.
- Keep app bootstrap, route setup, and theme configuration in `lib/main.dart`.
- Prefer creating small, focused widgets and passing typed models between screens.

## Current Status

- The project has the initial Flutter scaffold and structure in place.
- `home_screen.dart` and `call_screen.dart` are currently placeholders.
- `Doctor` model is defined and ready for UI consumption.
- `ZegoConfig` is present for future ZEGOCLOUD integration.

## Recommended Next Work

- Implement `home_screen.dart` as the main doctor discovery screen.
- Implement `call_screen.dart` as the video consultation screen.
- Use `Doctor` model instances to drive UI state.
- Initialize ZEGOCLOUD call sessions using values from `lib/utils/zego_config.dart`.
