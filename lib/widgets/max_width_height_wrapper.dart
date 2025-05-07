import 'package:flutter/material.dart';

class MaxWidthHeightWrapper extends StatelessWidget {
  final Widget child;
  final double verticalPadding;
  final double horizontalPadding;
  final double maxWidth;

  const MaxWidthHeightWrapper({
    required this.child,
    this.verticalPadding = 16,
    this.horizontalPadding = 16,
    this.maxWidth = 1120,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
