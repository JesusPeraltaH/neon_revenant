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
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

class LittleRootMapComponent extends SpriteComponent {
  LittleRootMapComponent()
    : super(anchor: Anchor.topLeft, size: Vector2(946, 826));

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    try {
      print('Intentando cargar town.png...');
      final image = await Flame.images.load('town.png');
      print('Imagen cargada exitosamente: ${image.width}x${image.height}');

      sprite = Sprite(image);
      print('Mapa configurado - Tamaño: $size, Posición: $position');
    } catch (e) {
      print('Error al cargar el mapa: $e');
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    print(
      'Actualizando mapa - Posición: $position, Tamaño: $size',
    ); // Debug print
  }
}
