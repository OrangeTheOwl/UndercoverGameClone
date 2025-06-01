# UndercoverGameClone

"Undercover" is a social deduction word game where players try to identify each other's secret identities by describing secret words


## How To Use

To clone and run this application, you'll need [Git](https://git-scm.com) and [Flutter](https://docs.flutter.dev/get-started/install) From your command line:

```bash
# Clone this repository
$ git clone https://github.com/OrangeTheOwl/UndercoverGameClone

# Go into the repository
$ cd UndercoverGameClone/undercover_game

# Install dependencies
$ flutter pub get

# Run the app
$ flutter run
```
## Project structure

```bash
lib/
├── main.dart                 # Entry point of the application
├── models/
│   └── player_model.dart     # Data model for player information
├── utils/
│   └── word_pairs.dart       # Utility to manage word pair logic
├── views/
│   ├── home_view.dart        # Initial/home screen UI
│   ├── setup_view.dart       # Game setup screen
│   ├── vote_view.dart        # Voting screen
│   ├── word_view.dart        # Word display screen
│   └── winning_view.dart     # Winning screen after voting ends
└── view_models/
    └── game_viewmodel.dart   # Logic management for game flow
```
## Screenshots

![Home screen](./flutter_01.png?raw=true "Home screen")

![Setup screen](./flutter_02.png?raw=true "Setup screen")

![Name screen](./flutter_03.png?raw=true "Name screen")

![Word screen](./flutter_04.png?raw=true "Word screen")

![Lobby screen](./flutter_05.png?raw=true "Lobby screen")

![End screen](./flutter_06.png?raw=true "End screen")
