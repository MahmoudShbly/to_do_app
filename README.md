# 📝 Todo App with Fake API

A modern, feature-rich Todo application built with Flutter that demonstrates clean architecture principles, state management with BLoC, and RESTful API integration. This app provides a seamless task management experience with real-time updates and an intuitive user interface.

## ✨ Features

- ✅ **CRUD Operations**: Create, Read, Update, and Delete tasks
- 🔄 **Real-time Sync**: Integrates with DummyJSON API for task management
- 📊 **Task Organization**: Separate views for active tasks and completed tasks
- 🎨 **Beautiful UI**: Modern design with custom components and smooth animations
- 💫 **Loading States**: Shimmer effects for better UX during data fetching
- 🔔 **User Feedback**: Snackbar notifications for all actions
- 📱 **Responsive Design**: Optimized for various screen sizes

## 🛠️ Tech Stack

### Framework & Language
- **Flutter** - Cross-platform UI framework
- **Dart** - Programming language

### State Management
- **flutter_bloc (Cubit)** - Predictable state management

### Architecture
- **Clean Architecture** - Separation of concerns with layered structure
- **Feature-First Structure** - Organized by features for scalability

### Key Packages
- `http` - HTTP client for API requests
- `flutter_bloc` - State management solution
- `dartz` - Functional programming (Either for error handling)
- `google_fonts` - Custom typography
- `shimmer` - Loading skeleton screens
- `flutter_svg` - SVG image support

### API
- **DummyJSON API** - Mock REST API for todo operations

## 🏗️ Architecture

The project follows **Clean Architecture** principles with a **Feature-First** folder structure:

```
lib/
├── core/
│   ├── utils/
│   │   ├── api_service.dart          # HTTP client wrapper
│   │   ├── bloc_observer.dart        # BLoC event logging
│   │   ├── constants.dart            # App-wide constants
│   │   ├── failures.dart             # Error handling models
│   │   ├── helper_function.dart      # Utility functions
│   │   └── my_assets.dart            # Asset paths
│   └── widgets/
│       ├── custom_button.dart        # Reusable button widget
│       ├── custom_snack_bar_message.dart
│       └── custom_text_field.dart    # Reusable input field
│
└── features/
    └── home/
        ├── data/
        │   ├── models/
        │   │   └── task_model.dart   # Task data model
        │   └── services/
        │       ├── add_new_task_service.dart
        │       ├── delete_task_service.dart
        │       ├── edit_task_service.dart
        │       └── get_all_tasks_service.dart
        │
        └── presentation/
            ├── manager/              # State Management (Cubits)
            │   ├── add_new_task_cubit/
            │   ├── delete_task_cubit/
            │   ├── edit_task_cubit/
            │   └── fetch_all_tasks_cubit/
            │
            └── views/
                ├── home_view.dart
                ├── add_task_view.dart
                ├── edit_task_view.dart
                └── widgets/          # UI Components
```

### Architecture Layers

1. **Data Layer**
   - Models: Data representations
   - Services: API communication logic

2. **Presentation Layer**
   - Cubits: State management
   - Views: UI screens
   - Widgets: Reusable UI components

3. **Core Layer**
   - Utilities and shared resources
   - Reusable widgets across features

## 📂 Folder Structure

```
todo_app_with_api/
│
├── assets/
│   └── images/
│       ├── logo.svg
│       └── icon.svg
│
├── lib/
│   ├── core/
│   │   ├── utils/
│   │   └── widgets/
│   │
│   ├── features/
│   │   └── home/
│   │       ├── data/
│   │       │   ├── models/
│   │       │   └── services/
│   │       └── presentation/
│   │           ├── manager/
│   │           └── views/
│   │
│   └── main.dart
│
├── pubspec.yaml
└── README.md
```

## 🚀 How to Run the Project

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions
- An emulator or physical device

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/MahmoudShbly/to_do_app.git
   cd to_do_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Build for production**
   ```bash
   # Android
   flutter build apk --release
   
   # iOS
   flutter build ios --release
   ```

## 🧪 Testing

The app uses BLoC pattern which makes it highly testable. Each Cubit can be tested independently.

### Running Tests
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Test Structure
```
test/
├── unit/
│   ├── services/
│   └── cubits/
├── widget/
└── integration/
```

## 🎯 Key Implementation Details

### State Management
The app uses **Cubit** (simplified BLoC) for state management:
- `FetchAllTasksCubit` - Manages task list retrieval
- `AddNewTaskCubit` - Handles new task creation
- `EditTaskCubit` - Manages task updates
- `DeleteTaskCubit` - Handles task deletion

### Error Handling
Implements functional error handling using the `dartz` package:
```dart
Future<Either<Failures, TaskModel>> addTask({required String title})
```

### API Integration
RESTful API operations via `ApiService`:
- GET: Fetch all tasks
- POST: Create new task
- PUT: Update existing task
- DELETE: Remove task

## 🔮 Future Improvements

- [ ] **Local Storage**: Add offline support with SQLite/Hive
- [ ] **User Authentication**: Implement login/signup functionality
- [ ] **Task Categories**: Add support for task categorization
- [ ] **Due Dates**: Include task deadlines and reminders
- [ ] **Search & Filter**: Advanced task search and filtering
- [ ] **Dark Mode**: Implement theme switching
- [ ] **Priority Levels**: Add task priority management
- [ ] **Animations**: Enhanced micro-interactions
- [ ] **Unit Tests**: Comprehensive test coverage
- [ ] **CI/CD**: Automated testing and deployment pipeline

## 📸 Screenshots

### Home Screen - Tasks Tab
> *Display of active tasks with CRUD operations*

### Home Screen - Done Tab
> *Display of completed tasks*

### Add Task Dialog
> *Simple interface to create new tasks*

### Edit Task Screen
> *Update task details*

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**

- GitHub: [@MahmoudShbly](https://github.com/MahmoudShbly)
- Email: shbly1029@gmail.com

## 🙏 Acknowledgments

- [DummyJSON](https://dummyjson.com/) for providing the free REST API
- Flutter community for amazing packages and support
- Inspired by modern task management applications

---

<div align="center">

**If you found this project helpful, please give it a ⭐️!**

Made with ❤️ using Flutter

</div>