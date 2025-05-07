import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell shell;
  final void Function(int) onTabSelected;
  final int currentIndex;
  const HomeBottomNavigationBar({
    super.key,
    required this.shell,
    required this.onTabSelected,
    required this.currentIndex,
  });

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabSelected,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
