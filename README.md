# MediLink

MediLink is a Flutter-based healthcare app prototype focused on doctor discovery and future teleconsultation flows. The current implementation already provides a polished doctor listing experience, while the video-call layer is scaffolded for later ZEGOCLOUD integration.

## Tech Stack

- Flutter SDK with Dart
- Material Design UI and custom theme styling
- Stateless widget-based UI composition for screens and reusable cards
- ZEGOCLOUD UIKit for communication UI primitives
- ZEGOCLOUD prebuilt call package for video consultation workflows
- Android and iOS platform support through Flutter’s native project structure
- Flutter testing with `flutter_test` and linting with `flutter_lints`

## Architecture Overview

The app follows a simple layered structure that is easy to extend:

1. App bootstrap layer
   - [lib/main.dart](lib/main.dart) initializes the Flutter app and sets the root theme and home screen.
   - This file acts as the app shell and is the entry point for all screen navigation.

2. Presentation layer
   - Screens live in [lib/screens](lib/screens).
   - [lib/screens/home_screen.dart](lib/screens/home_screen.dart) is the main user-facing experience for browsing doctors.
   - [lib/screens/call_screen.dart](lib/screens/call_screen.dart) is reserved for the consultation/call experience and is currently a placeholder.

3. Reusable UI components layer
   - Widgets such as [lib/widgets/doctor_card.dart](lib/widgets/doctor_card.dart) and [lib/widgets/speciality_card.dart](lib/widgets/speciality_card.dart) keep the UI modular and reusable.
   - These components are composed by screens instead of being embedded directly in large view files.

4. Domain model layer
   - [lib/models/doctor.dart](lib/models/doctor.dart) defines the `Doctor` data model used by the home screen and future booking or consultation flows.
   - The model keeps doctor-related information structured and easy to pass between screens.

5. Integration and configuration layer
   - [lib/utils/zego_config.dart](lib/utils/zego_config.dart) centralizes third-party configuration values for ZEGOCLOUD.
   - Platform-specific configuration is handled in [android](android) and [ios](ios), which are managed by Flutter for native build support.

### Runtime Flow

```text
App startup
  -> lib/main.dart
  -> HomeScreen renders UI
  -> HomeScreen reads doctor data from Doctor model
  -> Reusable widgets display cards and specialist chips
  -> Future call flow will use ZegoConfig and CallScreen
```

## Project Structure

```text
android/                  # Native Android build configuration and Gradle setup
ios/                      # Native iOS build configuration and Xcode project files
lib/
  main.dart               # App entry point and root theme setup
  models/
    doctor.dart           # Doctor domain model and sample doctor data
  screens/
    home_screen.dart      # Main doctor discovery screen
    call_screen.dart      # Video consultation screen placeholder
  utils/
    zego_config.dart      # ZEGOCLOUD configuration constants
  widgets/
    doctor_card.dart      # Doctor list item UI component
    speciality_card.dart  # Specialty chip UI component
test/
  widget_test.dart        # Basic widget test scaffold
```

## File Connections and Responsibilities

- [lib/main.dart](lib/main.dart)
  - Boots the app with `MaterialApp`.
  - Sets the visual theme and points the app to the initial home screen.

- [lib/screens/home_screen.dart](lib/screens/home_screen.dart)
  - Serves as the main dashboard-style screen.
  - Calls `Doctor.getDoctors()` to retrieve sample data.
  - Composes the screen from the specialty cards and doctor list cards.

- [lib/screens/call_screen.dart](lib/screens/call_screen.dart)
  - Currently empty and intended to host the teleconsultation experience.
  - This is the natural place to wire in ZEGOCLOUD call widgets once credentials and session logic are ready.

- [lib/models/doctor.dart](lib/models/doctor.dart)
  - Stores doctor attributes such as `id`, `name`, `speciality`, `imageUrl`, `rating`, `experience`, and `isAvailable`.
  - Acts as the shared data source for the home screen and any future booking or consultation views.

- [lib/widgets/doctor_card.dart](lib/widgets/doctor_card.dart)
  - Renders each doctor item in the list.
  - Receives a `Doctor` object from the screen and displays profile information in a reusable card layout.

- [lib/widgets/speciality_card.dart](lib/widgets/speciality_card.dart)
  - Renders the horizontal specialist chips shown at the top of the home screen.
  - Keeps the specialty selection UI separate from screen logic.

- [lib/utils/zego_config.dart](lib/utils/zego_config.dart)
  - Holds the ZEGOCLOUD `appID` and `appSign` placeholders.
  - Keeps SDK credentials centralized so they can be replaced or loaded from a safer source later.

- [android](android) and [ios](ios)
  - Contain native configuration needed for platform builds, permissions, and third-party SDK integration.
  - These folders should be updated when adding native capabilities such as camera, microphone, or background call support.

## Development Guidelines for the Next Developer

- Keep screen-specific UI and navigation logic in [lib/screens](lib/screens).
- Keep reusable visual components in [lib/widgets](lib/widgets).
- Keep domain data models in [lib/models](lib/models).
- Keep third-party SDK settings and shared constants in [lib/utils](lib/utils).
- Use [lib/main.dart](lib/main.dart) for app-wide theme, bootstrap, and root navigation changes.

## Current State of the Project

- The app already has a working doctor discovery UI shell.
- The home screen is wired to a sample doctor dataset.
- The call screen and ZEGOCLOUD integration are prepared as the next major implementation step.
- The structure is intentionally modular so new features can be added without cluttering the main entry point.
