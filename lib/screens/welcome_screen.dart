import 'package:flutter/material.dart';
import 'package:neon_revenant/game/GameScreen.dart';
import 'package:neon_revenant/screens/store_screen.dart';
import 'package:neon_revenant/widgets/google_sign_in_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido a Mi Juego',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
              child: Text('Jugar como Invitado'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StoreScreen()),
                );
              },
              child: Text('Tienda'),
            ),
            SizedBox(height: 20),
            GoogleSignInButton(),
          ],
        ),
      ),
    );
  }
}
