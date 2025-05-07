import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart' as ul;

class AppLink extends StatelessWidget {
  final Widget child;
  final Uri? uri;

  const AppLink({
    required this.child,
    this.uri,
  });

  @override
  Widget build(final BuildContext context) {
    return ul.Link(
      uri: uri,
      builder: (final _, final __) => child,
    );
  }
}
