import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:neon_revenant/game/GameScreen.dart';
import 'package:neon_revenant/images.dart';

class HomeScreen extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        print("Usuario autenticado: ${googleUser.displayName}");
      }
    } catch (error) {
      print("Error al iniciar sesión con Google: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Stack(
    children: [
      // Fondo escalado
      Transform.scale(
        scale: 1.3, // Aumenta este valor para hacerla más grande
        child: Image.asset(
          'assets/fondo.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),

      // Contenido encima del fondo
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Neon Revenant",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _signInWithGoogle,
              child: Text("Inicia sesión"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
              child: Text("Juega sin iniciar sesión"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _signInWithGoogle,
              child: Image.asset('assets/images/glogo.png', width: 50, height: 50),
            ),
          ],
        ),
      ),
    ],
  ),
);


  }
}
