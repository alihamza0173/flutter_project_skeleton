import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final double size;
  final Color color;

  const Dot({
    required this.size,
    required this.color,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
