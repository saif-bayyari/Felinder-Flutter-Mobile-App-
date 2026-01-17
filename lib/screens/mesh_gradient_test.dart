import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import '../routes.dart';

class MeshGradientTest extends StatefulWidget {
  const MeshGradientTest({super.key});

  @override
  State<MeshGradientTest> createState() => _MeshGradientTestState();
}

class _MeshGradientTestState extends State<MeshGradientTest> {
  double _size = 1.0;

  void grow() {
    setState(() { _size += 0.1; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // Add Scaffold for proper structure
      body: Column(
        children: [
          Expanded(  // Use Expanded to give it available space
            child: Container(  // Wrap in Container
              width: double.infinity,  // Full width
              child: MeshGradient(
                points: [
                  MeshGradientPoint(
                    position: const Offset(
                      0.5,
                      0.5,
                    ),
                    color: const Color.fromRGBO(255, 105, 180, 1),
                  ),
                  MeshGradientPoint(
                    position: const Offset(
                      0.4,
                      0.5,
                    ),
                    color: const Color.fromARGB(255, 69, 18, 255),
                  ),
                  MeshGradientPoint(
                    position: const Offset(
                      0.7,
                      0.4,
                    ),
                    color: Colors.pink
                  ),
                  MeshGradientPoint(
                    position: const Offset(
                      0.4,
                      0.9,
                    ),
                    color: Colors.pinkAccent,
                  ),
                ],
                options: MeshGradientOptions(blend: 7),
              ),
            ),
          ),
          Padding(  // Add some padding for the button
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}