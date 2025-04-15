import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:neon_revenant/game/neon_revenant_game.dart';
import 'package:neon_revenant/widgets/joystick_widget.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final NeonRevenantGame _game = NeonRevenantGame();

  // Define la altura que quieres para el área de controles
  final double controlsAreaHeight = 220.0; // Ajusta este valor según necesites

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Puedes añadir un AppBar si quieres un título arriba
      // appBar: AppBar(title: Text("Neon Revenant")),
      body: SafeArea( // SafeArea es importante para evitar áreas como notches o barras de estado
        child: Column( // El widget principal ahora es Column
          children: [
            // --- 1. Área de Juego ---
            Expanded(
              // Expanded hace que este widget ocupe todo el espacio vertical
              // restante después de que el área de controles tome su altura fija.
              child: ClipRect( // ClipRect asegura que el GameWidget no dibuje fuera de sus límites
                child: GameWidget(
                  game: _game,
                  // Puedes añadir aquí overlays específicos del juego si los necesitas
                  // overlayBuilderMap: { ... },
                  // initialActiveOverlays: [ ... ],
                ),
              ),
            ),

            // --- 2. Separador (Opcional) ---
            Divider(
              height: 2,       // Altura total del espacio del divisor
              thickness: 2,    // Grosor de la línea
              color: Colors.grey[600], // Color de la línea
              indent: 10,      // Espacio antes de la línea
              endIndent: 10,   // Espacio después de la línea
            ),

            // --- 3. Área de Controles ---
            Container(
              height: controlsAreaHeight, // Altura fija para los controles
              color: Colors.black87, // Color de fondo para el área de controles (opcional)
              child: Stack( // Usamos un Stack aquí DENTRO del Container para posicionar libremente los controles
                children: [
                  // Joystick Izquierdo (Movimiento)
                  Positioned(
                    left: 40,
                    bottom: 40, // Posición relativa a la parte inferior de ESTE Container
                    child: SizedBox(
                      width: 100, // Ajusta tamaño según necesites
                      height: 100,
                      child: JoystickWidget(
                        isShooting: false,
                        onDirectionChanged: (direction) {
                          _game.movementDirection = direction;
                        },
                      ),
                    ),
                  ),

                  // Joystick Derecho (Disparo)
                  Positioned(
                    right: 40,
                    bottom: 40, // Posición relativa a la parte inferior de ESTE Container
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: JoystickWidget(
                        isShooting: true,
                        onDirectionChanged: (direction) {
                           _game.shootingDirection = direction;
                        },
                      ),
                    ),
                  ),

                  // Botón de Menú (Ej: Esquina superior izquierda del área de controles)
                  Positioned(
                    top: 20,
                    left: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica para menú
                        print("Botón Menú presionado");
                      },
                      child: Text("Menú"),
                    ),
                  ),

                   // Botón Flecha (Ej: Esquina superior derecha del área de controles)
                   Positioned(
                     top: 20,
                     right: 20,
                     child: ElevatedButton(
                       onPressed: () {
                         // Lógica para flecha
                       },
                       child: Icon(Icons.arrow_upward),
                     ),
                   ),

                   // Botón '+' (Ej: Cerca del centro, ajusta left/right/top/bottom)
                   Positioned(
                     bottom: 20, // Ejemplo: abajo y centrado horizontalmente
                     left: 0,
                     right: 0,
                     child: Center( // Para centrarlo horizontalmente dentro del Positioned que ocupa todo el ancho
                       child: ElevatedButton(
                         onPressed: () {
                           // Lógica para "+"
                         },
                         child: Text("+", style: TextStyle(fontSize: 20)),
                       ),
                     ),
                   ),

                  // Añade aquí el resto de tus botones usando Positioned o Align
                  // dentro de este Stack. Sus coordenadas (top, left, bottom, right)
                  // serán relativas al Container del área de controles.

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}