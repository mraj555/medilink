# MediLink

MediLink is a Flutter mobile app prototype for healthcare discovery and early-stage teleconsultation workflows. The codebase is built as a clean UI prototype with doctor browsing, specialties, and a scaffolded video call experience using ZEGOCLOUD prebuilt call components.

## Tech Stack

- Flutter SDK / Dart
- Material Design / custom theming
- `zego_uikit`, `zego_uikit_prebuilt_call`, `zego_zimkit` for video call and communication support
- `flutter_test` for widget testing
- `flutter_lints` for lint rules and code quality guidance
- Native targets: Android and iOS via Flutter platform folders

## Architecture Overview

The app uses a simple layered architecture with a clear separation between:

- app bootstrap and theme configuration
- presentation screens
- reusable UI components
- domain models and sample data
- third-party SDK configuration

### Core Flow

1. `lib/main.dart` boots the app and sets the global theme.
2. `HomeScreen` renders the main doctor discovery interface.
3. `Doctor.getDoctors()` supplies the static list of doctors.
4. `HomeScreen` composes the layout using `SpecialityCard` and `DoctorCard` components.
5. Tapping the call button on an available doctor navigates to `CallScreen`.
6. `CallScreen` initializes the ZEGOCLOUD prebuilt call component with runtime call metadata.

## Project Structure

```text
android/                  # Native Android project configuration and Gradle setup
ios/                      # Native iOS project configuration and Xcode workspace
lib/
  main.dart               # App entry point, MaterialApp, themes, and initial screen
  models/
    doctor.dart           # Doctor entity, sample data, and local data provider
  screens/
    home_screen.dart      # Main doctor listing and search screen
    call_screen.dart      # One-on-one call screen built with ZEGOCLOUD prebuilt call SDK
  utils/
    zego_config.dart      # ZEGOCLOUD appID/appSign configuration values
  widgets/
    doctor_card.dart      # Doctor item UI component and navigation action
    speciality_card.dart  # Specialty chip UI component used in the home screen
test/
  widget_test.dart        # Flutter widget test scaffold
analysis_options.yaml     # Linting rules and static analysis settings
pubspec.yaml              # Dart/Flutter package configuration and dependency manifest
README.md                 # Project overview and architecture documentation
```

## File Responsibilities

- `lib/main.dart`
  - Entrypoint for the app.
  - Configures `MaterialApp`, theming, and initial route.
  - Uses `HomeScreen` as the landing experience.

- `lib/screens/home_screen.dart`
  - Builds the doctor discovery screen.
  - Shows search, specialty cards, and the list of doctors.
  - Loads the demo doctor list from `Doctor.getDoctors()`.

- `lib/screens/call_screen.dart`
  - Handles the outgoing consultation call screen.
  - Uses `ZegoUIKitPrebuiltCall` with runtime-generated `userID`, `userName`, and `callID`.
  - Renders the provider’s avatar and call UI config.

- `lib/widgets/doctor_card.dart`
  - Renders each doctor row including image, rating, experience, and availability.
  - Contains the call button that navigates to `CallScreen` only when the doctor is online.

- `lib/widgets/speciality_card.dart`
  - Displays a horizontal specialty chip.
  - Keeps specialty UI isolated from the home screen layout.

- `lib/models/doctor.dart`
  - Defines the `Doctor` domain model.
  - Includes a static sample dataset used by the current app.
  - Acts as the current contract for doctor profile data across the app.

- `lib/utils/zego_config.dart`
  - Centralizes ZEGOCLOUD SDK configuration values.
  - Allows the call screen to remain implementation-focused rather than storing credentials inline.

- `android/` and `ios/`
  - Contain native build, permissions, and runtime configuration required by Flutter.
  - Required when adding device-level capabilities such as camera, microphone, or SDK platform integration.

## Runtime Data and State

- The app currently uses local, in-memory doctor data.
- There is no external backend, repository layer, or state management package yet.
- UI state is built declaratively through widget composition.
- Expansion points include a service/data layer, state management solution, or API integration.

## Component Relationships

```text
main.dart
  └─> HomeScreen
        ├─> Doctor.getDoctors()
        ├─> SpecialityCard x N
        └─> ListView of DoctorCard
              └─> CallScreen (when available)
                    └─> ZegoUIKitPrebuiltCall
```

## Extension Points for Next Developer

- Convert `Doctor.getDoctors()` from static sample data into a network-backed repository.
- Add a dedicated state management layer using Riverpod, Provider, Bloc, Cubit, or similar.
- Replace `HomeScreen` search field with real search filtering and specialty selection state.
- Expand `CallScreen` to support real call lifecycle events, participants, and hangup flows.
- Add authentication, appointment scheduling, chat, and patient profile screens.
- Move reusable theming and layout patterns into shared widget or theme files.

## Notes on ZEGOCLOUD Integration

- The project already includes ZEGOCLOUD packages in `pubspec.yaml`.
- `CallScreen` is wired to `ZegoUIKitPrebuiltCall` and expects configuration values from `lib/utils/zego_config.dart`.
- This screen is the main integration point for real-time consultation UI.

## Recommended Organization Guidelines

- Keep screen-level layout and navigation inside `lib/screens/`.
- Keep reusable UI pieces inside `lib/widgets/`.
- Keep domain entities and data providers inside `lib/models/`.
- Keep integration/config constants inside `lib/utils/`.
- Keep platform-specific or native SDK wiring inside `android/` and `ios/`.
