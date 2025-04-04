import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:neon_revenant/widgets/joystick_widget.dart';



class _JoystickWidgetState extends State<JoystickWidget> {
  Offset _dragPosition = Offset.zero;
  DateTime _lastUpdate = DateTime.now();

  void _onPanUpdate(DragUpdateDetails details) {
    // Limita la frecuencia de actualización a cada 50ms (puedes ajustar este valor)
    final now = DateTime.now();
    if (now.difference(_lastUpdate).inMilliseconds < 50) return;
    _lastUpdate = now;

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
          color: widget.isShooting
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
