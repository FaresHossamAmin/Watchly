# Watchly

A Flutter Movie Browsing App built with Clean Architecture principles.
Browse and explore movies with a clean, scalable codebase following best practices.

## Features

### Browse trending and popular movies
- Movie details page (overview, rating, release date, etc.)
- Built with Bloc
- Scalable & maintainable code using Clean Architecture

## Project Structure
lib/
┣ core/                 # Core layer (shared utilities & base classes)
┃ ┣ constants/          # App constants (API keys, URLs, etc.)
┃ ┣ errors/             # Error handling & exceptions
┃ ┣ network/            # Networking Error
┃ ┣ router/             # App navigation and route handling
┃ ┣ services/           # Service locator (getIt)
┃ ┣ usecase/            # Base usecase classes
┃ ┗ utils/              # Helper functions & extensions
┃
┣ movies/
┃ ┣ data/               # Data layer
┃ ┃ ┣ datasources/      # Remote & local data sources
┃ ┃ ┣ models/           # Data models (DTOs)
┃ ┃ ┗ repositories/     # Repository implementations
┃ ┣ domain/             # Domain layer
┃ ┃ ┣ entities/         # Core business entities
┃ ┃ ┣ repositories/     # Repository contracts
┃ ┃ ┗ usecases/         # Application use cases
┃ ┗ presentation/       # UI layer
┃   ┣ bloc/             # State management (BLoC)
┃   ┣ screens/          # Screens / Pages
┃   ┣ components/       # More Complex Reusable widgets
┃   ┗ widgets/          # Simpler Reusable Widgets
┃
┗ main.dart             # App entry point

## Tech Stack

Flutter (Dart)
Clean Architecture (Data → Domain → Presentation)
Bloc for state management
Dio for API requests
TMDB API for movies data
