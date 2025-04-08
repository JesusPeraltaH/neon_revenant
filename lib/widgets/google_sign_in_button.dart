import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInButton extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _handleSignIn,
      child: Text('Ingresar con Google', style: TextStyle(color: Colors.white),),
      style: ElevatedButton.styleFrom(
         backgroundColor: Color(0xFF1A1616),
      ),
    );
  }
}
