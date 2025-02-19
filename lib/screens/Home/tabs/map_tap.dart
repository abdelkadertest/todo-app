import 'package:flutter/material.dart';

class MapTap extends StatelessWidget {
  static const String routeName = "map_tap";
  const MapTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Tap'),
      ),
      body: Center(
        child: Text('Map Tap'),
      ),
    );
  }
}
