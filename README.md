# News App - Clean Architecture & Test Driven Development

Orbit is a modern news app built using Flutter, designed to deliver the latest news in a fast and user-friendly way.

![Screenshot](screenshot.png)
## Features

- Clean Architecture & TDD
- State Management: flutter_bloc
- Navigation: Get
- Dependency Injection: get_it
- REST API: dio, retrofit
- Local Database: sqflite, hive
- Data Classes: freezed, json_serializable
- Linting: dart_code_metrics, flutter_lints
- Unit Testing: mocktail, bloc_test
- Utilities: rxdart, dartx, async
- UI: shimmer, google_fonts

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) should be installed on your machine.
- You will need an API key from [NewsAPI](https://newsapi.org/).

### Setup Instructions

1. **Clone the repository:**

    ```bash
    git clone https://github.com/mylzdev/orbit-news-app.git
    cd orbit-news-app
    ```

2. **Add your API key:**

    Create a new file named `.env` in the `root` directory:

    ```dart
    // .env
    API_KEY = YOUR_API_KEY_HERE
    ```

    Replace `'YOUR_API_KEY_HERE'` with your actual NewsAPI key.

3. **Install dependencies:**

    ```bash
    flutter pub get
    ```

4. **Run the app:**

    ```bash
    flutter run
    ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
