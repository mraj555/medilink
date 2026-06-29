# MediLink

MediLink is a Flutter-based healthcare app prototype focused on doctor discovery and the foundation for teleconsultation flows. The current implementation already provides a polished doctor-listing experience, while the video-call experience is scaffolded for future ZEGOCLOUD integration.

## Product Overview

MediLink is designed as a modular mobile UI for a healthcare platform. Its main purpose today is to present doctors in a visually rich and reusable interface, show specialties, and prepare the navigation flow for a consultation/call experience.

## Tech Stack

- Flutter SDK with Dart
- Material Design widgets and custom visual theming
- Widget-based UI composition with reusable components
- ZEGOCLOUD UIKit and prebuilt call packages for future real-time consultation workflows
- Native Android and iOS support through Flutter’s platform folders
- Unit and widget testing with Flutter test support
- Linting with Flutter Lints

## Architecture Summary

The application follows a simple layered architecture that keeps business data, UI screens, and reusable widgets separated.

```text
App Entry Point
  -> main.dart
  -> MyApp theme setup
  -> HomeScreen
       -> Doctor model data
       -> SpecialityCard widgets
       -> DoctorCard widgets
            -> CallScreen navigation
```

### Architectural Layers

1. App bootstrap layer
   - [lib/main.dart](lib/main.dart) initializes the Flutter app, defines the app theme, and sets the initial screen.
   - This is the single entry point for global styling and app-level navigation behavior.

2. Presentation layer
   - [lib/screens/home_screen.dart](lib/screens/home_screen.dart) is the main user-facing screen for browsing doctors.
   - [lib/screens/call_screen.dart](lib/screens/call_screen.dart) is the target screen for the consultation experience and currently acts as a placeholder.

3. Reusable UI layer
   - [lib/widgets/doctor_card.dart](lib/widgets/doctor_card.dart) renders each doctor item in the list.
   - [lib/widgets/speciality_card.dart](lib/widgets/speciality_card.dart) renders the specialty chips displayed at the top of the home screen.

4. Domain data layer
   - [lib/models/doctor.dart](lib/models/doctor.dart) defines the Doctor model and provides the sample doctor dataset.
   - This model is the current source of truth for doctor profiles shown in the UI.

5. Integration and configuration layer
   - [lib/utils/zego_config.dart](lib/utils/zego_config.dart) is intended to centralize ZEGOCLOUD configuration values.
   - Native configuration lives in [android](android) and [ios](ios), where permissions and SDK-specific setup are handled.

## Project Structure

```text
android/                  # Native Android build configuration
ios/                      # Native iOS build configuration
lib/
  main.dart               # App entry point and global theme
  models/
    doctor.dart           # Doctor data model and sample data
  screens/
    home_screen.dart      # Main doctor discovery screen
    call_screen.dart      # Placeholder teleconsultation screen
  utils/
    zego_config.dart      # ZEGOCLOUD config placeholder
  widgets/
    doctor_card.dart      # Doctor card UI component
    speciality_card.dart  # Specialty chip UI component
test/
  widget_test.dart        # Basic widget test scaffold
```

## File-by-File Responsibilities

- [lib/main.dart](lib/main.dart)
  - Starts the app with MaterialApp.
  - Defines the brand colors, typography, and the initial HomeScreen route.

- [lib/screens/home_screen.dart](lib/screens/home_screen.dart)
  - Builds the main doctor discovery experience.
  - Calls Doctor.getDoctors() to load the sample dataset.
  - Composes the search bar, specialty list, and doctor list.

- [lib/screens/call_screen.dart](lib/screens/call_screen.dart)
  - Receives a Doctor object when the user enters a consultation flow.
  - Currently renders a placeholder view and is the natural place to plug in the real-time calling UI.

- [lib/widgets/doctor_card.dart](lib/widgets/doctor_card.dart)
  - Displays the doctor profile, specialty, rating, years of experience, and call button.
  - Handles the navigation action from the card to the call screen when the doctor is available.

- [lib/widgets/speciality_card.dart](lib/widgets/speciality_card.dart)
  - Displays the specialty filter chips shown at the top of the home screen.
  - Keeps the specialty UI independent from the main screen logic.

- [lib/models/doctor.dart](lib/models/doctor.dart)
  - Defines the Doctor class and its properties.
  - Acts as the data contract between the UI layer and any future API or backend service.

- [lib/utils/zego_config.dart](lib/utils/zego_config.dart)
  - Holds the ZEGOCLOUD configuration values that will be used when the call feature is implemented.
  - Keeps SDK credentials and related values centralized for easier maintenance.

- [android](android) and [ios](ios)
  - Contain platform-native project files for building the app on each target OS.
  - These folders are relevant whenever native camera, microphone, permissions, or call support needs to be wired in.

## How the Current Flow Works

1. The app launches from [lib/main.dart](lib/main.dart).
2. MyApp routes the user to [lib/screens/home_screen.dart](lib/screens/home_screen.dart).
3. HomeScreen pulls a list of doctors from [lib/models/doctor.dart](lib/models/doctor.dart).
4. The screen renders specialty cards and doctor cards through the widget layer.
5. When a user taps the call button on an available doctor, the app navigates to [lib/screens/call_screen.dart](lib/screens/call_screen.dart) with the selected Doctor object.

## Current Data and State Model

- The app currently uses a static in-memory dataset from [lib/models/doctor.dart](lib/models/doctor.dart).
- There is no dedicated state-management package in place yet; the UI is composed directly from widget state and model data.
- The structure is intentionally simple so it can evolve into a full-featured healthcare application.

## Where to Extend the App

- Replace the static doctor data with a real API or backend service.
- Implement the actual teleconsultation experience inside [lib/screens/call_screen.dart](lib/screens/call_screen.dart).
- Move shared state into a dedicated provider, bloc, or riverpod layer as the app grows.
- Add authentication, user profiles, appointments, and chat modules as separate feature areas.

## Development Notes for the Next Developer

- Keep screen-level navigation and layout inside [lib/screens](lib/screens).
- Keep reusable visual components inside [lib/widgets](lib/widgets).
- Keep the domain model and sample data inside [lib/models](lib/models).
- Keep third-party SDK configuration inside [lib/utils](lib/utils).
- Use [lib/main.dart](lib/main.dart) for app-wide theme and bootstrap-level changes.
