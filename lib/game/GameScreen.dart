import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:neon_revenant/game/neon_revenant_game.dart';

class GameScreen extends StatelessWidget {
  final NeonRevenantGame game = NeonRevenantGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🎮 Área jugable (mitad superior de la pantalla)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height:
                MediaQuery.of(context).size.height * 0.7, // 70% de la pantalla
            child: GameWidget(game: game),
          ),

          // 🎮 Controles en pantalla (mitad inferior)
          Positioned(
            left: 20,
            bottom: 20,
            child: JoystickWidget(
              isShooting: false,
              onDirectionChanged: (direction) {
                game.movementJoystick.update(direction);
              },
            ),
          ),

          Positioned(
            right: 20,
            bottom: 20,
            child: JoystickWidget(
              isShooting: true,
              onDirectionChanged: (direction) {
                game.shootingJoystick.update(direction);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class JoystickWidget extends StatefulWidget {
  final bool isShooting;
  final Function(Vector2)? onDirectionChanged;

  const JoystickWidget({
    Key? key,
    required this.isShooting,
    this.onDirectionChanged,
  }) : super(key: key);

  @override
  _JoystickWidgetState createState() => _JoystickWidgetState();
}

class _JoystickWidgetState extends State<JoystickWidget> {
  Offset _dragPosition = Offset.zero;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragPosition = details.localPosition;
    });

    final center = Offset(50, 50); // Centro del joystick
    final delta = _dragPosition - center;
    final direction = Vector2(delta.dx, delta.dy).normalized();

    widget.onDirectionChanged?.call(direction);
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _dragPosition = Offset.zero;
    });

    widget.onDirectionChanged?.call(Vector2.zero());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              widget.isShooting
                  ? Colors.red.withOpacity(0.3)
                  : Colors.blue.withOpacity(0.3),
        ),
        child: Center(
          child: Transform.translate(
            offset: _dragPosition,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.isShooting ? Colors.red : Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
