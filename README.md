# Adnan Weather App

The Adnan Weather App is a Flutter application that provides real-time weather information based on the user's location. It uses the OpenWeatherMap API to fetch weather data.

## Features

- **Current Location Weather:** Automatically fetches and displays the weather information based on the user's current location.
- **Weather Details:** Displays temperature, weather conditions, and an icon representing the current weather.
- **Responsive UI:** Adapts to different screen sizes and orientations.

## Getting Started

### Prerequisites

- Flutter SDK: >=2.15.0 <3.0.0
- Dart SDK
- JDK 8
- OpenWeatherMap API key

### Dependencies

The main dependencies used in this project are:

- `flutter`
- `cupertino_icons: ^1.0.2`
- `location: ^4.0.0`
- `flutter_bloc: ^7.3.0`
- `http: ^0.13.3`

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/adnanAlKharfan/weather-app-Flutter.git
   cd weather-app-Flutter
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
   
3. **Add OpenWeatherMap API key:**
   - Open \`lib/bloc.dart\`
   - Replace \`YOUR_API_KEY\` with your OpenWeatherMap API key in the \`url\` variable.


   
4. **Run the application:**
   ```sh
   flutter run
   ```

## Project Structure

- **lib:** Contains the main application code.
  - \`main.dart\`: Entry point of the application.
  - \`bloc.dart\`: Contains the BLoC pattern implementation for state management and fetching weather data.

- **pubspec.yaml\`: Project configuration file specifying dependencies and assets.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## Contact

For any inquiries or support, please contact [Adnan AlKharfan](https://github.com/adnanAlKharfan).


