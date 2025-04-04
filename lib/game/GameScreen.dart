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
            // -- Distribución vertical: área de juego (arriba) y controles (abajo)
            Column(
              children: [
                // Parte superior para el juego
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.black,
                    // Aquí podrías usar GameWidget si lo deseas:
                    // child: GameWidget(game: game),
                  ),
                ),
                // Parte inferior para controles
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.grey[800]),
                ),
              ],
            ),

            // -- Joystick de movimiento (esquina inferior izquierda)
            Positioned(
              left: 40,
              bottom: 60,
              child: Container(
                width: 120,
                height: 120,
                child: JoystickWidget(
                  isShooting: false,
                  onDirectionChanged: (direction) {
                    game.movementJoystick.update(direction);
                  },
                ),
              ),
            ),

            // -- Joystick de disparo (esquina inferior derecha)
            Positioned(
              right: 40,
              bottom: 60,
              child: Container(
                width: 120,
                height: 120,
                child: JoystickWidget(
                  isShooting: true,
                  onDirectionChanged: (direction) {
                    game.shootingJoystick.update(direction);
                  },
                ),
              ),
            ),

            // -- Botón de Menú (arriba izquierda)
            Positioned(
              top: 600,
              left: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para menú
                },
                child: Text("Menu"),
              ),
            ),

            // -- Botón "+" (aprox. centro-derecha)
            Positioned(
              // Ajusta la posición según tu preferencia
              top: MediaQuery.of(context).size.height * 0.7,
              right: 150,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para "+"
                },
                child: Text("+"),
              ),
            ),

            // -- Botón Flecha (arriba derecha)
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
