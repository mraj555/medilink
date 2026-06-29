# MediLink

MediLink is a Flutter-based healthcare discovery and teleconsultation prototype. It combines a polished doctor-discovery experience with a scaffolded video consultation flow using ZEGOCLOUD prebuilt UI components. The project is intentionally lightweight and is structured as a frontend-first prototype that is easy for the next developer to extend.

## Tech Stack

- Flutter SDK with Dart
- Material Design styling and custom theme configuration
- Cupertino icons for platform-style visuals
- ZEGOCLOUD SDKs:
  - zego_uikit
  - zego_uikit_prebuilt_call
- Testing support via flutter_test
- Linting and static analysis via flutter_lints
- Native mobile targets: Android and iOS

## Architecture Overview

The app follows a simple layered structure that keeps responsibilities separated:

1. App bootstrap layer
   - Initializes the Flutter app and global theme in the entry point.
2. Presentation layer
   - Screens such as the home experience and the consultation call experience live here.
3. UI component layer
   - Reusable widgets such as doctor cards and specialty cards are kept isolated.
4. Domain/data layer
   - The current app uses a local model and sample dataset rather than a remote API.
5. Integration layer
   - Third-party video calling logic is isolated behind the call screen and configuration utility.

## High-Level Flow

The current user journey is intentionally straightforward:

1. The app starts from the main entry point and loads the home screen.
2. The home screen renders a doctor discovery UI using sample doctor data.
3. Specialty chips and doctor cards are composed as reusable UI pieces.
4. Selecting a doctor with an available status opens the consultation screen.
5. The consultation screen initializes the ZEGOCLOUD prebuilt call experience.

## Project Structure

```text
android/                  # Native Android configuration, Gradle setup, and platform integration
ios/                      # Native iOS configuration and Xcode project files
lib/
  main.dart               # App entry point, theme setup, and initial route bootstrap
  models/
    doctor.dart           # Doctor domain model and local sample data source
  screens/
    home_screen.dart      # Main doctor discovery screen
    call_screen.dart      # Video consultation screen using ZEGOCLOUD UI
  utils/
    zego_config.dart      # Shared ZEGOCLOUD configuration values
  widgets/
    doctor_card.dart      # Reusable doctor list item UI
    speciality_card.dart  # Reusable specialty chip UI
test/
  widget_test.dart        # Basic widget test scaffold
analysis_options.yaml     # Linting and analyzer rules
pubspec.yaml              # Flutter package dependencies and project metadata
README.md                 # Developer-facing project documentation
```

## File Responsibilities and Connections

### App bootstrap

- lib/main.dart
  - Entry point for the application.
  - Creates the MaterialApp instance.
  - Applies the app theme and launches the home screen.

### Home experience

- lib/screens/home_screen.dart
  - Represents the primary user-facing dashboard.
  - Composes the search area, specialty selection UI, and doctor listing.
  - Pulls doctor data from the local model layer.

### Doctor data model

- lib/models/doctor.dart
  - Defines the Doctor model structure.
  - Stores the current static sample dataset used by the UI.
  - Acts as the current contract for doctor information across the app.

### Reusable UI building blocks

- lib/widgets/doctor_card.dart
  - Renders each doctor entry in the list.
  - Displays doctor details such as name, specialty, rating, experience, and availability.
  - Triggers navigation to the call screen when the doctor is currently available.

- lib/widgets/speciality_card.dart
  - Displays specialty chips in the UI.
  - Keeps the specialty presentation logic separate from the main screen layout.

### Consultation flow

- lib/screens/call_screen.dart
  - Hosts the consultation call experience.
  - Uses the ZEGOCLOUD prebuilt call widget with runtime-generated user and call metadata.
  - Keeps the real-time calling implementation isolated from the rest of the app.

- lib/utils/zego_config.dart
  - Centralizes SDK configuration values used by the call screen.
  - Prevents call-specific configuration from being embedded directly into the UI layer.

### Platform layer

- android/ and ios/
  - Contain native settings and project files required for Flutter builds.
  - Relevant when adding camera, microphone, permissions, or platform-specific SDK support.

## Component Relationship Map

```text
main.dart
  └── HomeScreen
        ├── Doctor.getDoctors()
        ├── SpecialityCard
        └── DoctorCard list
              └── CallScreen
                    └── ZegoUIKitPrebuiltCall
```

## Current State of Data and State Management

The project currently uses:

- Local, in-memory doctor data
- Stateless or declarative widget composition for UI rendering
- No dedicated backend, repository layer, or external state-management package yet

This makes the current structure ideal for a prototype, but it also indicates the natural next evolution points.

## Extension Points for the Next Developer

The current architecture is already organized for gradual growth:

- Replace the static doctor dataset with a repository backed by an API or service layer.
- Introduce a formal state management approach such as Provider, Riverpod, Bloc, or Cubit.
- Move screen-specific logic into view models or controllers as the app grows.
- Expand the call screen into a complete consultation lifecycle with join, leave, and status handling.
- Add authentication, appointment booking, chat, and patient profile flows.
- Centralize shared styling and reusable layout patterns into a stronger theme or shared widget structure.

## Development Notes

- Keep screen and navigation logic inside the screens folder.
- Keep reusable visual components inside the widgets folder.
- Keep model definitions and sample data inside the models folder.
- Keep SDK-specific configuration inside the utils folder.
- Keep platform-specific integration details inside the Android and iOS folders.
