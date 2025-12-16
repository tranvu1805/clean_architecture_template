# Clean Architecture Template Brick

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A Mason brick for bootstrapping Flutter projects with Clean Architecture foundation.

## Overview

This brick generates a complete Clean Architecture base structure for Flutter projects with:
- **Core Layer**: Essential utilities, error handling, and base classes
- **Dependency Injection**: Pre-configured GetIt service locator
- **Routing**: Go Router setup with shell navigation
- **Theme System**: Customizable theme with predefined color palette
- **Network Layer**: HTTP API service with error handling
- **Type Definitions**: Functional error handling with fpdart
- **Project Setup**: Automatic dependency installation

## Installation

```bash
mason add template
```

Or add from Git:

```bash
mason add template --git-url https://github.com/tranvu1805/clean_architecture_template.git
```

## Usage

Navigate to your Flutter project directory and run:

```bash
mason make template
```

The brick will automatically:
1. Extract your project name from `pubspec.yaml`
2. Generate the core architecture structure
3. Create the `/lib/features` folder if it doesn't exist
4. Install all required dependencies

## Variables ✨

| Variable       | Description                          | Default          | Type     |
|----------------|--------------------------------------|------------------|----------|
| `project_name` | Your Flutter project name            | Auto-detected    | `string` |

**Note:** The `project_name` variable is automatically extracted from your `pubspec.yaml` by the pre-generation hook.

## Generated Structure

```
lib/
└── core/
    ├── constants/
    │   ├── app.dart                    # App-wide constants (baseUrl, pageSize)
    │   └── colors_app.dart             # Color palette definitions
    ├── data_source/
    │   └── common_local_data_source.dart # Base local data source
    ├── di/
    │   └── service_locator.dart        # GetIt dependency injection setup
    ├── enums/
    │   └── enums.dart                  # Common enumerations
    ├── errors/
    │   ├── exceptions.dart             # Exception classes
    │   └── failures.dart               # Failure classes with factory methods
    ├── network/
    │   └── api_service.dart            # HTTP API service with error handling
    ├── route/
    │   ├── app_shell.dart              # Shell navigation widget
    │   ├── router.dart                 # Go Router configuration
    │   └── routes.dart                 # Route path constants
    ├── theme/
    │   └── app_theme.dart              # Material Theme configuration
    └── utils/
        └── helper/
            ├── method_utils.dart        # Utility methods
            └── type_definition.dart     # Type aliases for functional programming
```

## Core Features

### 🎯 Clean Architecture Foundation
- Separation of concerns with layered architecture
- Dependency inversion principle
- Ready for feature module expansion

### 🔥 Error Handling
- `Either` type from fpdart for functional error handling
- Custom exception and failure classes
- Automatic error conversion and localized messages
- Timeout and network error handling

### 🌐 Network Layer
- Pre-configured HTTP client
- Centralized API service with error handling
- Base URL configuration
- Request timeout handling (10 seconds)

### 🧭 Navigation
- Go Router with shell navigation
- Predefined routes (splash, sign in, sign up, etc.)
- Bottom navigation bar ready structure

### 🎨 Theme System
- Material 3 design
- Custom color palette with 15+ predefined colors
- Comprehensive text theme definitions
- Customizable input decoration theme

### 🔧 Type Definitions
- `ResultFuture<T>` - Future returning Either<Failure, T>
- `ResultVoid` - Future returning Either<Failure, void>
- Base UseCase interfaces

## Dependencies

The brick automatically installs the following packages:

### Production Dependencies:
- `flutter_bloc` - State management
- `equatable` - Value equality
- `http` - HTTP client
- `get_it` - Dependency injection
- `go_router` - Declarative routing
- `fpdart` - Functional programming
- `flutter_launcher_icons` - App icons

### Development Dependencies:
- `bloc_test` - BLoC testing utilities
- `mocktail` - Mocking library

## Hooks

### Pre-generation Hook
- Validates `pubspec.yaml` existence
- Extracts project name for imports
- Creates `/lib/features` folder if missing

### Post-generation Hook
- Installs all production dependencies
- Installs all development dependencies
- Provides installation progress feedback

## Color Palette

The template includes a comprehensive color palette in `ColorApp`:
- Amber Orange (`#E89923`)
- Linen Orange (`#FFD09F`)
- Dark Orange (`#8B5E3C`)
- Peach Puff (`#FDF0E2`)
- Linen White (`#FEFBF7`)
- And 10+ more carefully selected colors

## Use Cases

This template provides base classes for implementing use cases:
- `UseCase<T>` - For use cases without parameters
- `UseCaseWithParams<T, Params>` - For use cases with parameters

Example:
```dart
class GetUserUseCase implements UseCaseWithParams<User, String> {
  @override
  ResultFuture<User> call(String userId) async {
    // Implementation
  }
}
```

## Prerequisites

- Flutter SDK (3.0.0 or higher recommended)
- Mason CLI installed
- Valid Flutter project with `pubspec.yaml`

## Best Practices

1. **Feature Modules**: Create feature modules in `/lib/features/` following Clean Architecture
2. **Dependency Injection**: Register dependencies in `service_locator.dart`
3. **Error Handling**: Use `ResultFuture` and `Either` for all data operations
4. **Routing**: Add new routes to `routes.dart` and configure in `router.dart`
5. **Constants**: Define API URLs and app constants in `core/constants/app.dart`

## Related Bricks

Consider using these complementary bricks:
- [**feature**](https://github.com/yourusername/feature_brick.git) - Generate complete feature modules with domain, data, and presentation layers

## Example Project Structure

After using this template, your feature modules should follow:
```
lib/
├── core/                  # Generated by this brick
└── features/
    └── your_feature/
        ├── data/
        ├── domain/
        └── presentation/
```

## Troubleshooting

**Issue**: Import errors after generation
- **Solution**: Run `flutter pub get` and restart your IDE

**Issue**: Route conflicts
- **Solution**: Update `routes.dart` with your custom routes

**Issue**: Theme not applied
- **Solution**: Ensure `appTheme` is passed to `MaterialApp`

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

See [LICENSE](LICENSE) file.

## Author

Vu Tran

---

_Generated by [Mason](https://github.com/felangel/mason) 🧱_
