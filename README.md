# Interactive Story App

A simple interactive story app built with Flutter. Users can read a story and make choices that change the narrative, leading to different endings.

## Features

*   Interactive story with choices
*   Multiple endings
*   State management using Provider
*   Local data storage using SQLite

## Folder Structure


lib/
├── main.dart
├── screens
│   ├── story_screen.dart
│   └── end_screen.dart
├── models
│   ├── story_node.dart
│   └── choice.dart
├── services
│   └── database_service.dart
└── providers
    └── story_provider.dart


## Getting Started

1.  Clone the repository.
2.  Run `flutter pub get` to install dependencies.
3.  Run the app on your device or emulator using `flutter run`.

## Database Setup

The app uses SQLite for local data storage. The database is created and managed by the `DatabaseService` class. Make sure to have the necessary platform-specific setup for SQLite.

## State Management

The app uses the `Provider` package for state management. The `StoryProvider` class manages the current state of the story and provides methods for navigating the story and making choices.
