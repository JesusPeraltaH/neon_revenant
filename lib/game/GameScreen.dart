import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:neon_revenant/game/neon_revenant_game.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(game: NeonRevenantGame()),

          // 🎮 Controles en pantalla
          Positioned(
            left: 20,
            bottom: 20,
            child: JoystickWidget(isShooting: false), // Movimiento
          ),

          Positioned(
            right: 20,
            bottom: 20,
            child: JoystickWidget(isShooting: true), // Disparo
          ),
        ],
      ),
    );
  }
}

class JoystickWidget extends StatelessWidget {
  final bool isShooting;

  const JoystickWidget({Key? key, required this.isShooting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            isShooting
                ? Colors.red.withOpacity(0.3)
                : Colors.blue.withOpacity(0.3),
      ),
      child: Center(
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isShooting ? Colors.red : Colors.blue,
          ),
        ),
      ),
    );
  }
}
