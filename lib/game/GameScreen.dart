import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:neon_revenant/game/neon_revenant_game.dart';
import 'package:neon_revenant/widgets/joystick_widget.dart';

class GameScreen extends StatelessWidget {
  final NeonRevenantGame game = NeonRevenantGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Área de juego
            Positioned.fill(
              child: 
              //GameWidget(game: game),
              GameWidget(
                game: NeonRevenantGame(),
            ),
            ),
            // Joystick de movimiento (esquina inferior izquierda)
            Positioned(
              left: 40,
              bottom: 60,
              child: SizedBox(
                width: 120,
                height: 120,
                child: JoystickWidget(
                  isShooting: false,
                  onDirectionChanged: (direction) {
                    game.movementDirection = direction;
                  },
                ),
              ),
            ),
            // Joystick de disparo (esquina inferior derecha)
            Positioned(
              right: 40,
              bottom: 60,
              child: SizedBox(
                width: 120,
                height: 120,
                child: JoystickWidget(
                  isShooting: true,
                  onDirectionChanged: (direction) {
                    game.shootingDirection = direction;
                  },

                ),
              ),
            ),
            // Botón de Menú (arriba izquierda)
            Positioned(
              top: 600,
              left: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para menú
                },
                child: Text("Menú"),
              ),
            ),
            // Botón "+" (aproximadamente en el centro-derecha)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.7,
              right: 150,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para "+"
                },
                child: Text("+"),
              ),
            ),
            // Botón Flecha (arriba derecha)
            Positioned(
              top: 600,
              right: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para flecha
                },
                child: Icon(Icons.arrow_upward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
