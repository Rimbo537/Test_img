import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  const FullImageScreen({super.key, required this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Unsplash JSON')),
      ),
      body: Center(
        child: Container(
          child: Image.network(image.toString()),
        ),
      ),
    );
  }
}
