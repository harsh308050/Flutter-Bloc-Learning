# 🚀 Flutter BLoC Learning Repository

A comprehensive collection of Flutter projects demonstrating **BLoC (Business Logic Component)** state management pattern with practical examples ranging from basic counter apps to advanced API integration.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![BLoC](https://img.shields.io/badge/BLoC-0175C2?style=for-the-badge&logo=flutter&logoColor=white)

## 📚 Table of Contents

- [Overview](#overview)
- [Projects](#projects)
  - [1. Counter App](#1-counter-app)
  - [2. Todo List](#2-todo-list)
  - [3. Login Page BLoC](#3-login-page-bloc)
  - [4. BLoC App (GET API Demo)](#4-bloc-app-get-api-demo)
  - [5. BLoC Products](#5-bloc-products)
- [Project Structure Navigator](#project-structure-navigator)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Key Concepts Covered](#key-concepts-covered)
- [Dependencies](#dependencies)
- [Learning Path](#learning-path)
- [Contributing](#contributing)
- [License](#license)

---

## 🎯 Overview

This repository serves as a complete learning resource for mastering **Flutter BLoC pattern**. Each project is designed to teach specific concepts progressively, from fundamental state management to complex real-world scenarios like API integration and form validation.

### What You'll Learn:
- ✅ BLoC vs Cubit pattern implementation
- ✅ Event-driven architecture
- ✅ State management best practices
- ✅ API integration with BLoC
- ✅ Form validation using BLoC
- ✅ Repository pattern for data layer
- ✅ Separation of concerns in Flutter apps

---

## 📁 Projects

### 1. Counter App
**Difficulty:** ⭐ Beginner  
**Path:** [`/counter`](./counter)

The classic Flutter counter example reimagined with BLoC pattern. Perfect starting point for understanding BLoC fundamentals.

#### Features:
- Increment/Decrement counter using BLoC
- Simple event-state flow
- Clean separation of UI and logic

#### Project Structure:
```
counter/
├── lib/
│   ├── main.dart              # App entry point with BlocProvider
│   ├── counter.dart           # Counter BLoC implementation
│   └── counterUI.dart         # UI layer with BlocBuilder
└── pubspec.yaml               # Dependencies: flutter_bloc ^9.1.1
```

#### Key Files:
- **`counter.dart`**: Defines the Counter BLoC with increment/decrement logic
- **`counterUI.dart`**: Stateless UI that rebuilds on state changes
- **`main.dart`**: App initialization with BlocProvider

---

### 2. Todo List
**Difficulty:** ⭐⭐ Intermediate  
**Path:** [`/todolist`](./todolist)

A task management app implementing **Cubit** (simplified BLoC) for CRUD operations.

#### Features:
- Add, update, and delete todos
- Toggle completion status
- Cubit pattern implementation
- List state management

#### Project Structure:
```
todolist/
├── lib/
│   ├── main.dart              # App setup with BlocProvider
│   ├── todoCubit.dart         # Cubit for todo operations
│   ├── model.dart             # Todo data model
│   └── TodoListUI.dart        # Interactive todo interface
└── pubspec.yaml               # Dependencies: flutter_bloc ^9.1.1
```

#### Key Concepts:
- **Cubit vs BLoC**: Learn when to use Cubit for simpler state management
- **Model classes**: Data representation for todos
- **List manipulation**: Add, remove, update operations in state

---

### 3. Login Page BLoC
**Difficulty:** ⭐⭐⭐ Intermediate-Advanced  
**Path:** [`/loginpage_bloc`](./loginpage_bloc)

Complete authentication UI with form validation using BLoC pattern.

#### Features:
- Email & password validation
- Form state management
- Login event handling
- Error state management
- Loading states

#### Project Structure:
```
loginpage_bloc/
├── lib/
│   ├── main.dart                    # App initialization
│   ├── bloc/
│   │   ├── login_bloc.dart          # Login BLoC logic
│   │   ├── login_event.dart         # Login events (submit, validate)
│   │   └── login_state.dart         # Login states (initial, loading, success, error)
│   ├── login/
│   │   └── login_page.dart          # Login UI with form fields
│   ├── Model/                       # User models
│   └── repo/                        # Authentication repository
└── pubspec.yaml
```

#### Key Features:
- **Event-driven validation**: Real-time form validation
- **Multiple states**: Loading, success, error handling
- **Repository pattern**: Separation of business logic and data layer

---

### 4. BLoC App (GET API Demo)
**Difficulty:** ⭐⭐⭐ Advanced  
**Path:** [`/bloc_app`](./bloc_app)

Demonstrates API integration with BLoC for fetching and displaying remote data.

#### Features:
- HTTP GET requests
- Loading, success, and error states
- API response parsing
- Clean architecture with repository pattern

#### Project Structure:
```
bloc_app/
├── lib/
│   ├── main.dart                    # Material app setup
│   └── screens/
│       ├── home_screen.dart         # Main UI screen
│       ├── bloc/
│       │   ├── [bloc_files]         # BLoC, Events, States
│       ├── data/
│       │   ├── [repository_files]   # Data layer abstraction
│       └── model/
│           └── [model_files]        # Data models for API response
└── pubspec.yaml                     # Dependencies: http ^1.6.0, flutter_bloc ^9.1.1
```

#### Architecture Layers:
1. **Presentation Layer** (`home_screen.dart`): UI components
2. **BLoC Layer** (`bloc/`): Business logic and state management
3. **Data Layer** (`data/`): Repository for API calls
4. **Model Layer** (`model/`): Data classes

---

### 5. BLoC Products
**Difficulty:** ⭐⭐⭐⭐ Advanced  
**Path:** [`/bloc_products`](./bloc_products)

Full-featured product catalog app with navigation, detail views, and API integration.

#### Features:
- Product listing from API
- Detail page navigation
- Advanced BLoC state management
- Multi-screen navigation
- HTTP data fetching

#### Project Structure:
```
bloc_products/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── homepage.dart                # Product list view
│   ├── productdetails.dart          # Product detail screen
│   ├── bloc/
│   │   ├── bloc.dart                # Product BLoC
│   │   ├── event.dart               # Product events (fetch, select)
│   │   └── state.dart               # Product states
│   ├── data/
│   │   ├── datasrc.dart             # Data source for API
│   │   └── repository.dart          # Repository implementation
│   └── model/
│       └── model.dart               # Product model class
└── pubspec.yaml
```

#### Advanced Concepts:
- **Navigation with BLoC**: Passing state between screens
- **Data source abstraction**: Separating API calls from business logic
- **Complex state management**: Handling lists and individual item states

---

## 🗺️ Project Structure Navigator

### Common Flutter Project Structure
Each project follows Flutter's standard structure:

```
project_name/
├── android/                  # Android platform-specific code
├── ios/                      # iOS platform-specific code
├── linux/                    # Linux desktop code
├── macos/                    # macOS desktop code
├── web/                      # Web platform code
├── windows/                  # Windows desktop code
├── lib/                      # 🎯 Main Dart source code (YOUR FOCUS)
├── test/                     # Unit and widget tests
├── build/                    # Build outputs (auto-generated)
├── pubspec.yaml             # Dependencies and metadata
├── analysis_options.yaml    # Linter rules
└── README.md                # Project documentation
```

### Understanding the `lib/` Directory

This is where all your Dart code lives! Here's the typical organization:

```
lib/
├── main.dart               # 🚀 App entry point - Start here!
├── [screen_name].dart      # Individual screen widgets
│
├── bloc/                   # BLoC pattern files
│   ├── [name]_bloc.dart    # BLoC class (business logic)
│   ├── [name]_event.dart   # Events that trigger state changes
│   └── [name]_state.dart   # States representing UI states
│
├── data/                   # Data layer
│   ├── datasrc.dart        # Data sources (API clients)
│   └── repository.dart     # Repository pattern implementation
│
├── model/                  # Data models
│   └── model.dart          # PODO (Plain Old Dart Objects)
│
└── screens/                # UI screens
    └── [screen_name].dart  # Screen widgets
```

---

## 🔧 Prerequisites

Before running these projects, ensure you have:

- **Flutter SDK:** >= 3.9.2
- **Dart SDK:** >= 3.9.2
- **IDE:** VS Code, Android Studio, or IntelliJ IDEA
- **Devices/Emulators:** Android, iOS, or Web browser

### Installation Check:
```bash
flutter --version
flutter doctor
```

---

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/harsh308050/Flutter-Bloc-Learning.git
cd Flutter-Bloc-Learning
```

### 2. Navigate to a Project
```bash
cd counter  # or any other project folder
```

### 3. Install Dependencies
```bash
flutter pub get
```

### 4. Run the App
```bash
flutter run
```

Or for specific platforms:
```bash
flutter run -d chrome          # Web
flutter run -d windows         # Windows
flutter run -d android         # Android
flutter run -d ios             # iOS
```

---

## 🎓 Key Concepts Covered

### BLoC Pattern Components

#### 1. **Events**
User interactions or triggers that initiate state changes.
```dart
// Example: login_event.dart
abstract class LoginEvent {}
class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;
}
```

#### 2. **States**
Represent the current status of the application.
```dart
// Example: login_state.dart
abstract class LoginState {}
class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginError extends LoginState {
  final String message;
}
```

#### 3. **BLoC**
Business logic that processes events and emits states.
```dart
// Example: login_bloc.dart
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      // Process login logic
      emit(LoginSuccess());
    });
  }
}
```

#### 4. **UI Layer**
Widgets that listen to state changes and rebuild accordingly.
```dart
BlocBuilder<LoginBloc, LoginState>(
  builder: (context, state) {
    if (state is LoginLoading) return CircularProgressIndicator();
    if (state is LoginSuccess) return SuccessScreen();
    return LoginForm();
  },
)
```

---

## 📦 Dependencies

### Core Dependencies (Common across projects):
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^9.1.1        # State management
  cupertino_icons: ^1.0.8     # iOS icons
  http: ^1.6.0                # HTTP requests (for API projects)

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0       # Linting rules
```

---

## 📈 Learning Path

Follow this recommended order for optimal learning:

1. **Start with Counter** (`/counter`)  
   → Understand basic BLoC setup, events, and state emission

2. **Move to Todo List** (`/todolist`)  
   → Learn Cubit pattern, list state management, CRUD operations

3. **Try Login Page** (`/loginpage_bloc`)  
   → Master form validation, multiple states, error handling

4. **Explore BLoC App** (`/bloc_app`)  
   → Integrate APIs, repository pattern, clean architecture

5. **Build with BLoC Products** (`/bloc_products`)  
   → Advanced navigation, multi-screen BLoC, complex state

---

## 🎯 Project Comparison

| Feature | Counter | TodoList | Login | BLoC App | BLoC Products |
|---------|---------|----------|-------|----------|---------------|
| Pattern | BLoC | Cubit | BLoC | BLoC | BLoC |
| API Integration | ❌ | ❌ | ❌ | ✅ | ✅ |
| Navigation | ❌ | ❌ | ❌ | ❌ | ✅ |
| Form Validation | ❌ | ❌ | ✅ | ❌ | ❌ |
| Repository Pattern | ❌ | ❌ | ✅ | ✅ | ✅ |
| Data Models | ❌ | ✅ | ✅ | ✅ | ✅ |
| Complexity | ⭐ | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |

---

## 🔍 Quick Navigation Guide

### Need to Understand BLoC Basics?
👉 Start with `/counter/lib/counter.dart`

### Want to Learn API Integration?
👉 Check `/bloc_app/lib/screens/data/` and `/bloc_products/lib/data/`

### Looking for Form Validation?
👉 Explore `/loginpage_bloc/lib/bloc/`

### Studying Repository Pattern?
👉 Review `/bloc_app/lib/screens/data/repository.dart`

### Understanding Cubit?
👉 See `/todolist/lib/todoCubit.dart`

---

## 🤝 Contributing

Contributions are welcome! Feel free to:
- 🐛 Report bugs
- 💡 Suggest new examples
- 🔧 Submit pull requests
- 📖 Improve documentation

### How to Contribute:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👨‍💻 Author

**Harsh Patel**  
GitHub: [@harsh308050](https://github.com/harsh308050)

---

## 📚 Additional Resources

- [Official BLoC Documentation](https://bloclibrary.dev/)
- [Flutter Documentation](https://flutter.dev/docs)
- [BLoC Package on pub.dev](https://pub.dev/packages/flutter_bloc)
- [Flutter BLoC Tutorial](https://www.youtube.com/results?search_query=flutter+bloc+tutorial)

---

## 🎉 Happy Learning!

If this repository helped you learn BLoC, please consider giving it a ⭐ star!

### Quick Start Commands:
```bash
# Clone and run counter app
git clone https://github.com/harsh308050/Flutter-Bloc-Learning.git
cd Flutter-Bloc-Learning/counter
flutter pub get
flutter run
```

---

**Made with ❤️ and Flutter**
