# 🚗 Waslny Rider - Flutter Order Taxi App

A Flutter order-a-Taxi application with custom UI components, real-time location tracking, and trip management features.

## ✨ Features

- **Authentication**: Phone number login with OTP verification through a waslny telegram bot
- **Maps & Location**: Google Maps integration with location selection and saved addresses
- **Trip Booking**: Create trips (immediate/scheduled) with multiple stops, vehicle selection, and custom options
- **Order Management**: View trip history and track orders in real-time(still in progress)
- **Wallet**: Digital wallet with money codes and payment methods
- **Discounts**: Manage and apply discount cards
- **Custom UI**: Fully custom-designed interface with dark/light mode support
- **Multi-language**: Arabic and English support (RTL/LTR)(needs to work on it)
- **Themes**: Dark and Light modes(needs to work on it)

## 🛠 Tech Stack & Main Dependencies

- **Flutter** ^3.6.1
- **GetX** ^4.7.2 - State management & routing
- **Google Maps** - Map integration and location services
- **Pusher Channels** - Real-time updates
- **HTTP** - API communication

See `pubspec.yaml` for complete dependencies.

## 📁 Project Structure

```
lib/
├── components/    # Custom UI components (buttons, text fields, bottom sheets, etc.)
├── screens/       # App screens (login, home, orders, settings, etc.)
├── controllers/   # GetX controllers for state management
├── models/        # Data models
├── tools/         # Custom calendar & time picker(to go with the Figma design)
├── constants.dart # App constants
└── main.dart      # Entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.6.1+
- Google Maps API key
- Android Studio / VS Code
- Physical device or emulator for testing

### Installation

1. Clone the repository

   ```bash
   git clone <repository-url>
   cd waslny_rider
   ```

2. Install dependencies

   ```bash
   flutter pub get
   ```

3. Run the app
   ```bash
   flutter run
   ```

## 🪄 Design

### 📸 Screenshots:

View the complete UI design: [Figma Link](https://www.figma.com/design/HWHTjJoTfET6pRxGaBBTmj/Waslny?node-id=0-1&p=f&t=edB9geqJBebuFSyy-0)

### 🎥 App Demo:

coming soon!

## 🏗️ Architecture

- **State Management**: GetX (reactive state, dependency injection, routing)
- **Architecture**: MVC-like pattern (Controllers, Screens, Models)
- **UI**: All components are custom-built (no default templates)

## 📝 About

This project demonstrates advanced Flutter development with:

- Custom widget architecture
- Real-time features with Pusher(still working on it)
- Google Maps integration
- Production-ready code structure

**Built with ❤️ using Flutter**
