# Chasivnyk

[![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.0.0-blue.svg)](https://flutter.dev)
[![Style: Effective Dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://dart.dev/effective-dart)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](LICENSE)

## Overview

Chasivnyk is an offline-first task management application built with Flutter. It helps users organize their time effectively through:

- ⏰ Task scheduling with flexible recurrence options
- 📊 Progress tracking and statistics
- 🏷️ Task categorization and tagging
- 📅 Timeline view for better planning
- 🔔 Smart reminders and notifications

## Project structure

### Core
```
/lib
    /core
        /constants      # Constants (colors, sizes, keys)
        /errors         # Error handling
        /utils          # Utilities
        /extensions     # Extensions
        /theme          # Themes
        /di             # Dependency injection
        /config         # Configurations
        /navigation     # Navigation
```

### Data Layer
```
    /data
        /models         # Data models
        /datasources    # Local storage
        /repositories   # Repositories
        /dto            # Data Transfer Objects
        /mappers        # Data conversion
```

### Domain Layer
```
    /domain
        /entities       # Business models
        /usecases       # Business logic
```

### Presentation Layer
```
    /presentation
        /providers      # State management
        /screens        # Screens
        /widgets        # UI components
        /common         # Common UI elements
        /navigation     # Navigation components
        /viewmodels     # UI logic

    /generated          # Generated code
    /l10n               # Localization
```

### Assets
```
/assets
    /images
    /fonts

/test                  # Tests
```

## Getting Started

### Prerequisites

- Flutter SDK >=3.0.0
- Dart SDK >=3.0.0
- Android Studio / VS Code

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/chasivnyk.git
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details