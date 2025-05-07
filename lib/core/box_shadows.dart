import 'package:flutter/material.dart';

class BoxShadows {
  const BoxShadows._();

  static final s1 = BoxShadow(
    offset: const Offset(0, -2),
    blurRadius: 4,
    spreadRadius: -1,
    color: Colors.black.withValues(alpha: 0.04),
  );
}
