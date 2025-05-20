import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final int score;

  const ScoreWidget({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Score: $score',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 2),
            ],
          ),
        ),
      ),
    );
  }
}
