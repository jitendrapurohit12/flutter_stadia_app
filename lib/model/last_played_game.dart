import 'package:flutter_stadia_app/style_guide/asset_paths.dart';

class LastPlayedGame {
  String name, imagePath;
  int hoursPlayed;
  double gameProgress;

  LastPlayedGame(
      {this.name, this.imagePath, this.hoursPlayed, this.gameProgress});
}

List<LastPlayedGame> lastPlayedGames = [
  LastPlayedGame(
      name: 'Assasin\'s Creed Odyssey',
      imagePath: game_assassins_creed_odyssey,
      hoursPlayed: 10,
      gameProgress: 0.20),
  LastPlayedGame(
      name: 'Dead Cells',
      imagePath: game_dead_cells,
      hoursPlayed: 50,
      gameProgress: 0.80),
  LastPlayedGame(
      name: 'Stardew Valley',
      imagePath: game_stardew_valley,
      hoursPlayed: 90,
      gameProgress: 0.95),
  LastPlayedGame(
      name: 'No Man\'s Sky',
      imagePath: game_no_mans_sky,
      hoursPlayed: 3,
      gameProgress: 0.10)
];

List<String> popularWithFriends = [
  game_fortnite,
  game_apex_legends,
  game_pubg
];
