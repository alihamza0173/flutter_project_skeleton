# flutter_project_skeleton

A scalable, modular Flutter app template designed for rapid project bootstrapping. This template features best practices including BLoC state management, localization, theming, environment configuration, and a clean, maintainable folder structure.

---

## Features

- **State Management:** Uses `flutter_bloc` and `hydrated_bloc` for robust, persistent state management.
- **Localization:** Built-in support for multiple languages using custom `AppLocalizations`.
- **Theming:** Centralized theme management for easy customization.
- **Routing:** Declarative navigation with `MaterialApp.router` and a dedicated router configuration.
- **Environment Variables:** Securely manage secrets and environment-specific values with `flutter_dotenv`.
- **Persistence:** Uses `hydrated_bloc` and `path_provider` for local state persistence.
- **Modular Structure:** Clean separation of concerns with dedicated folders for blocs, models, pages, widgets, utils, and more.

---

## Folder Structure

```
lib/
├── blocs/           # BLoC files for state management
├── core/            # Core utilities and base classes
├── extensions/      # Dart/Flutter extension methods
├── models/          # Data models
├── others/          # Miscellaneous utilities or helpers
├── pages/           # App screens/pages
├── router/          # App routing configuration
├── services.dart/   # Service classes (API, DB, etc.)
├── themes/          # Theme and style definitions
├── translations/    # Localization files and logic
├── utils/           # Utility functions and helpers
├── widgets/         # Reusable UI components
└── main.dart        # App entry point
```

---

## Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [hydrated_bloc](https://pub.dev/packages/hydrated_bloc)
- [path_provider](https://pub.dev/packages/path_provider)
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- [wc_dart_framework](https://pub.dev/packages/wc_dart_framework) (custom/optional)
- [flutter_localizations](https://docs.flutter.dev/accessibility-and-localization/internationalization)

---

## Getting Started

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/hun_nest_app.git
   cd hun_nest_app
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Set up environment variables:**
   - Create a `.env` file in the project root.
   - Add your environment-specific variables as needed.

4. **Run the app:**
   ```sh
   flutter run
   ```

---

## Localization

- Add new languages in `lib/translations/`.
- Update `AppLocalizations` to include new locales and delegates.

---

## State Management

- All BLoC logic is placed in `lib/blocs/`.
- Singleton pattern is used for global BLoCs (see `singleton_bloc.dart`).

---

## Theming

- Customize your app's look and feel in `lib/themes/themes.dart`.

---

## Routing

- Define and manage routes in `lib/router/app_router.dart`.

---

## Contribution

Feel free to fork and adapt this template for your own projects! PRs and issues are welcome.
