# Movies App

A Flutter app that explores popular, now-playing, top-rated, and upcoming movies through [TMDB](https://www.themoviedb.org/).

## Stack

- Flutter and Dart
- BLoC-style streams with RxDart
- Dio for HTTP requests
- TMDB API

## Run locally

This project deliberately keeps its TMDB read token outside the repository.

```bash
flutter pub get
flutter run --dart-define=TMDB_READ_ACCESS_TOKEN=your_token_here
```

For release builds, inject the same value from your CI secret store. Do not commit tokens, private keys, or signing files.

## Project status

This is a learning and portfolio project. The next improvement is to add test coverage for API failures and loading/error states.
