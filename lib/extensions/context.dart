import 'package:flutter/material.dart';

extension XBuildContext on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ThemeData get theme => Theme.of(this);

  void closeKeyboard() => FocusScope.of(this).unfocus();

  void showSnackBarMessage(
    final String message, {
    final bool isError = false,
    final Duration duration = const Duration(seconds: 3),
  }) {
    final theme = Theme.of(this);
    final Color? foregroundColor;
    final Color? backgroundColor;
    if (isError) {
      foregroundColor = theme.colorScheme.onError;
      backgroundColor = theme.colorScheme.error;
    } else {
      foregroundColor = null;
      backgroundColor = null;
    }

    ScaffoldMessenger.of(this).removeCurrentSnackBar();

    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: InkWell(
        onTap: () {
          ScaffoldMessenger.of(this).hideCurrentSnackBar();
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(message, style: TextStyle(color: foregroundColor)),
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration,
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
