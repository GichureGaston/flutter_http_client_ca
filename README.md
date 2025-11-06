# Flutter HTTP Client Example

A sample Flutter application demonstrating how to build a robust HTTP client using Clean Architecture principles. The app performs basic CRUD (Create, Read, Update, Delete) operations on a `Client` entity against a REST API.

## ✨ Features

- **Fetch** a client's data from the server.
- **Create** a new client and display the result.
- **Update** an existing client's information.
- **Delete** a client from the server.
- A simple, reactive UI built with `flutter_bloc`.

## 🏗️ Architecture & Tech Stack

This project follows the principles of **Clean Architecture** to create a separation of concerns between the different layers of the application. This makes the codebase scalable, maintainable, and testable.

The project is divided into three main layers:

1.  **Domain Layer:** The core of the application. It contains the business logic, entities, and repository interfaces. It is completely independent of any other layer.
2.  **Data Layer:** Responsible for providing data to the domain layer. It contains repository implementations and data sources (like the REST API client).
3.  **Presentation Layer:** The UI of the application. It uses the BLoC pattern to manage state and react to user input.

### Key Packages Used:

- **State Management:** `flutter_bloc`
- **Dependency Injection:** `get_it` & `injectable`
- **HTTP Requests:** `http`
- **JSON Serialization:** `json_serializable`
- **Value Equality:** `equatable`
- **Environment Variables:** `flutter_dotenv`

## 🚀 Getting Started

To run this project locally, you will need to run both a local mock server and the Flutter application.

### 1. Run the Local Mock Server

This project can be tested against a local mock API server. You have two options:

**Option A: Using `json-server` (Recommended)**

1.  **Install `json-server`:**
    ```sh
    npm install -g json-server
    ```
2.  **Start the server:** In a new terminal, navigate to the project root and run:
    ```sh
    json-server --watch db.json --host 0.0.0.0
    ```

**Option B: Using the built-in Python Server**

1.  **Start the server:** In a new terminal, navigate to the project root and run:
    ```sh
    python3 server.py
    ```

> **Note:** The server must be left running in its own terminal window.

### 2. Run the Flutter App

1.  **Create the `.env` file:** In the root of the project, create a file named `.env`.

2.  **Add the API URL:** Add the following line to the `.env` file, replacing `YOUR_COMPUTER_IP` with your actual local IP address (e.g., `192.168.0.106`).
    ```
    BASE_URL=http://YOUR_COMPUTER_IP:3000
    ```

3.  **Get dependencies:**
    ```sh
    flutter pub get
    ```

4.  **Run the code generator:**
    ```sh
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

5.  **Run the app:**
    ```sh
    flutter run
    ```

## 📂 Project Structure

The project follows a standard Clean Architecture directory structure:

```
lib/
├── data/
│   ├── mapper/
│   ├── models/
│   ├── remote/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── state/
│   └── views/
├── injection.dart
└── main.dart
```
