import 'package:flutter/material.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  final double value;

  const AnimatedLinearProgressIndicator({
    required this.value,
  });

  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final _, final ct) => AnimatedContainer(
        color: Colors.white,
        duration: const Duration(milliseconds: 300),
        height: 2,
        width: ct.maxWidth * value,
      ),
    );
  }
}

class ButtonProgressIndicator extends StatelessWidget {
  final Color? fgColor;
  final Color? bgColor;
  final double? value;

  const ButtonProgressIndicator({
    this.value,
    this.fgColor,
    this.bgColor,
  });

  @override
  Widget build(final BuildContext context) {
    final isParentOutlineButton =
        context.findAncestorWidgetOfExactType<OutlinedButton>() != null;
    final isParentElevatedButton =
        context.findAncestorWidgetOfExactType<ElevatedButton>() != null;

    final ButtonStyle? buttonStyle;
    if (isParentOutlineButton) {
      buttonStyle = OutlinedButtonTheme.of(context).style;
    } else if (isParentElevatedButton) {
      buttonStyle = ElevatedButtonTheme.of(context).style;
    } else {
      buttonStyle = null;
    }
    final valueColor = fgColor ??
        buttonStyle?.foregroundColor?.resolve({}) ??
        DefaultTextStyle.of(context).style.color!;
    return SizedBox(
      width: 15,
      height: 15,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        value: value,
        backgroundColor: bgColor ??
            (value == null
                ? null
                : valueColor.withValues(alpha: 0.5 * valueColor.a)),
        valueColor: AlwaysStoppedAnimation(valueColor),
      ),
    );
  }
}
