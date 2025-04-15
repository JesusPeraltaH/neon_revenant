// import 'package:flutter/material.dart';

// class LittleRoot extends StatelessWidget{

//   double x;
//   double y;
//   String currentMap;

//   LittleRoot({required this.x, required this.y,required this.currentMap});

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     if (currentMap == 'littleroot') {
//       return Container(
//         alignment: Alignment(x, y),
//           child: Image.asset('assets/images/town.png',
//           width: MediaQuery.of(context).size.width* 0.75,
//           fit: BoxFit.cover
//           ),
          
//       );
//     }else{
//       return Container();
//     }
//   }
// }


// maps/littleroot_component.dart
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class LittleRootMapComponent extends SpriteComponent {

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Carga la imagen del mapa desde tus assets
    sprite = await Sprite.load('town.png'); // Reemplaza con tu ruta de asset

    // Asegúrate de que el sprite tenga un tamaño (si no lo infiere de la imagen)
    // size = Vector2(1000, 800); // O el tamaño real de tu imagen de mapa
    // Si la imagen se carga correctamente, el tamaño se suele ajustar solo.
  }
}