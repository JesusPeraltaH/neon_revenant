// import 'package:flame/game.dart';
// import 'package:flutter/material.dart';
// import 'package:neon_revenant/game/neon_revenant_game.dart';
// import 'package:neon_revenant/widgets/joystick_widget.dart';
// import 'package:neon_revenant/widgets/score_widget.dart';

// class GameScreen extends StatefulWidget {
//   @override
//   _GameScreenState createState() => _GameScreenState();
// }

// class _GameScreenState extends State<GameScreen> {
//   late NeonRevenantGame _game;
//   int _score = 0;

//   // Define la altura que quieres para el área de controles
//   final double controlsAreaHeight = 150.0;

//   @override
//   void initState() {
//     super.initState();
//     _game = NeonRevenantGame(
//       // onScoreChanged: (newScore) {
//       //   setState(() {
//       //     _score = newScore;
//       //   });
//       // },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: Stack(
//                 children: [
//                   ClipRect(child: GameWidget(game: _game)),
//                   ScoreWidget(score: _score),
//                 ],
//               ),
//             ),
//             Divider(
//               height: 2,
//               thickness: 2,
//               color: Colors.grey[600],
//               indent: 10,
//               endIndent: 10,
//             ),
//             Container(
//               height: controlsAreaHeight,
//               color: Colors.black87,
//               child: Stack(
//                 children: [
//                   // Joystick Izquierdo (Movimiento)
// Positioned(
//   left: 40,
//   bottom: 20,
//   child: SizedBox(
//     width: 100,
//     height: 100,
//     child: JoystickWidget(
//       isShooting: false,
//       onDirectionChanged: (direction) {
//         _game.movementDirection = direction;
//       },
//     ),
//   ),
// ),

//                   // Botón de Acción
// Positioned(
//   right: 40,
//   bottom: 30,
//   child: ElevatedButton(
//     onPressed: () {
//       //_game.onActionButtonPressed();
//     },
//     style: ElevatedButton.styleFrom(
//       shape: CircleBorder(),
//       padding: EdgeInsets.all(20),
//       backgroundColor: Colors.blue,
//     ),
//     child: Icon(Icons.bolt, color: Colors.white, size: 30),
//   ),
// ),

//                   // Botón de Menú
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 10.0),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           print("Botón Menú presionado");
//                         },
//                         child: Text("Menú"),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:neon_revenant/game/neon_revenant_game.dart';
import 'package:neon_revenant/screens/welcome_screen_notlogged.dart';
import 'package:neon_revenant/widgets/joystick_widget.dart';

// Importa el ActionButton

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final NeonRevenantGame _game = NeonRevenantGame();

  // Define la altura para el área de controles
  final double controlsAreaHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final actionButtonRadius = 40.0;
    final joystickSize = 100.0;
    final joystickMargin = 40.0;
    final actionButtonMargin = 30.0;

    return Scaffold(
      backgroundColor: const Color(
        0xFF1E1E1E,
      ), // Color oscuro que coincide con el contenedor
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: GameWidget(game: _game)),
            Divider(
              height: 2,
              thickness: 2,
              color: Colors.grey[600],
              indent: 10,
              endIndent: 10,
            ),
            Container(
              height: controlsAreaHeight,
              color: Colors.grey[950],
              child: Stack(
                children: [
                  Positioned(
                    left: 40,
                    bottom: 20,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: JoystickWidget(
                        isShooting: false,
                        onDirectionChanged: (direction) {
                          _game.movementDirection = direction;
                        },
                      ),
                    ),
                  ),

                  Positioned(
                    right: 40,
                    bottom: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        _game.onActionButtonPressed();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.blue,
                      ),
                      child: Icon(Icons.bolt, color: Colors.white, size: 30),
                    ),
                  ),

                  // Botón de Menú (opcional, puedes ajustarlo o eliminarlo)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.grey[900],
                                title: Text(
                                  'Menú',
                                  style: TextStyle(color: Colors.white),
                                ),
                                content: Text(
                                  '¿Deseas volver al inicio?',
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                      ); // Cierra el diálogo
                                    },
                                    child: Text(
                                      'Cancelar',
                                      style: TextStyle(color: Colors.grey[400]),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                      ); // Cierra el diálogo
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => WelcomeScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Volver al inicio',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[800],
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Menú"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
