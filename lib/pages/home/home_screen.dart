import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../blocs/profile_bloc.dart';
import 'another_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String ROUTE_NAME = 'home';

  const HomeScreen();

  @override
  Widget build(final BuildContext context) {
    final bloc = ProfileBloc.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => bloc.logout(),
              child: const Text('Logout'),
            ),
            ElevatedButton(
              onPressed: () => context.goNamed(AnotherScreen.ROUTE_NAME),
              child: const Text('Another'),
            ),
          ],
        ),
      ),
    );
  }
}
