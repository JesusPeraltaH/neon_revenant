import 'package:flutter/material.dart';
import 'package:neon_revenant/game/GameScreen.dart';
import 'package:neon_revenant/screens/store_screen.dart';
import 'package:neon_revenant/widgets/google_sign_in_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagen de fondo
        Positioned.fill(
          child: Image.asset(
            'assets/fondo2.png',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
  'NEON REVENANT ',
  style: TextStyle(
    fontFamily: 'Sarpanch', // Usa el nombre de la familia que definiste en pubspec.yaml
    fontSize: 44,
    fontWeight: FontWeight.bold, // Mantén FontWeight.bold si quieres la versión en negrita
    color: Colors.white,
  ),
),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameScreen()),
                    );
                  },
                  icon: Icon(Icons.play_arrow, color: Colors.white,),
                  label: Text('Jugar como Invitado', style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Color(0xFF1A1616),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StoreScreen()),
                    );
                  },
                  icon: Icon(Icons.shopping_bag_outlined, color: Colors.white,),
                  label: Text('Tienda', style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Color(0xFF1A1616),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 80), // Agrega un espacio para separar del botón inferior
              ],
            ),
          ),
        ),
        // Botón de Google SignIn en la parte inferior
        Positioned(
          left: 0,
          right: 0,
          bottom: 30, // Ajusta la distancia desde la parte inferior según necesites
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90.0), // Ajusta el margen horizontal
            child: GoogleSignInButton(),
          ),
        ),
      ],
    );
  }
}