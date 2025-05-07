import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../auth/login/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String ROUTE_NAME = 'onboarding';

  const OnboardingScreen();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed(LoginScreen.ROUTE_NAME),
          child: const Text('Login'),
        ),
      ),
    );
  }
}
