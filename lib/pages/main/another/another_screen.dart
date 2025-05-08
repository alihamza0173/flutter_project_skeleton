import 'package:flutter/material.dart';

class AnotherScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/another';

  const AnotherScreen();

  @override
  Widget build(final BuildContext context) {
    return const Scaffold(body: Center(child: Text('Another')));
  }
}
