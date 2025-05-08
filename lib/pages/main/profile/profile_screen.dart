import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/profile';

  const ProfileScreen();

  @override
  Widget build(final BuildContext context) {
    return const Scaffold(body: Center(child: Text('Profile')));
  }
}
