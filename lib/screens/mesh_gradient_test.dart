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
    return Column(
        children: [MeshGradient(
          points: [
            MeshGradientPoint(
              position: const Offset(
                0.2,
                0.6,
              ),
              color: const Color.fromARGB(255, 251, 0, 105),
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
              color: const Color.fromARGB(255, 0, 255, 198),
            ),
            MeshGradientPoint(
              position: const Offset(
                0.4,
                0.9,
              ),
              color: const Color.fromARGB(255, 64, 255, 0),
            ),
          ],
          options: MeshGradientOptions(),
        ),
          ElevatedButton(
            onPressed: () {
              // Navigate back to first route when tapped.
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
    ]
    );
  }
}