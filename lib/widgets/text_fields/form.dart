import 'package:flutter/material.dart';

class AppForm extends StatelessWidget {
  final bool disable;
  final Widget child;

  static _AppForm? of(final BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_AppForm>();
  }

  const AppForm({
    this.disable = false,
    required this.child,
  });

  @override
  Widget build(final BuildContext context) {
    return _AppForm(
      disable: disable,
      child: Form(
        canPop: !disable,
        child: child,
      ),
    );
  }
}

class _AppForm extends InheritedWidget {
  final bool disable;

  const _AppForm({
    required this.disable,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant final _AppForm oldWidget) {
    if (oldWidget.disable != disable) {
      return true;
    }
    return false;
  }
}
