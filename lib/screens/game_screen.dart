import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:neon_revenant/game/my_game.dart';

class GameScreen extends StatelessWidget {
  final MyGame _game = MyGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GameWidget(game: _game));
  }
}
