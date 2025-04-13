import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _items = [
    {
      'name': 'Neon Bunny',
      'price': 300,
      'image': 'assets/personaje1.png',
    },
    {
      'name': 'Cyber Cat',
      'price': 500,
      'image': 'assets/personaje1.png',
    },
    {
      'name': 'Pixel Ghost',
      'price': 700,
      'image': 'assets/personaje1.png',
    },
  ];

  void _nextItem() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _items.length;
    });
  }

  void _previousItem() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + _items.length) % _items.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final item = _items[_currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/fondo2.png',
              fit: BoxFit.cover,
            ),
          ),

          // Overlay content
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NEON\nREVENANT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    letterSpacing: 2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'TIENDA',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),

                // Character Image + Arrows
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_left, color: Colors.white, size: 30),
                      onPressed: _previousItem,
                    ),
                    Container(
                      height: 120,
                      child: Image.asset(item['image']),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_right, color: Colors.white, size: 30),
                      onPressed: _nextItem,
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Text(
                  '${item['name']}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  '${item['price']} coins',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.yellowAccent,
                  ),
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    // Comprar lógica
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    'COMPRAR',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40),

                Text(
                  'Bienvenido Jesus Peralta',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
