import 'package:flutter/material.dart';

import 'image.dart';
import 'progress_indicator.dart';

class LoadingText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final LoadingTextIcon? prefixIcon;
  final LoadingTextIcon? suffixIcon;
  final bool isLoading;
  final double? loadingProgress;
  final double spacing;

  const LoadingText({
    required this.text,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isLoading = false,
    this.loadingProgress,
    this.spacing = 12,
  });

  @override
  Widget build(final BuildContext context) {
    final buttonStyle = ElevatedButtonTheme.of(context).style;

    if (isLoading) {
      return ButtonProgressIndicator(
        value: loadingProgress,
      );
    }
    final foregroundColor = buttonStyle?.foregroundColor?.resolve({});

    return Row(
      children: [
        if (prefixIcon != null) ...[
          AppImage(
            prefixIcon!.icon,
            color: prefixIcon!.isColorDynamic
                ? foregroundColor
                : prefixIcon!.color,
            width: prefixIcon!.size ?? prefixIcon!.width,
            height: prefixIcon!.size ?? prefixIcon!.height,
            fit: BoxFit.contain,
          ),
          SizedBox(width: spacing),
        ],
        Text(
          text,
          style: textStyle,
        ),
        if (suffixIcon != null) ...[
          SizedBox(width: spacing),
          AppImage(
            suffixIcon!.icon,
            color: suffixIcon!.isColorDynamic
                ? foregroundColor
                : suffixIcon!.color,
            width: suffixIcon!.size ?? suffixIcon!.width,
            height: suffixIcon!.size ?? suffixIcon!.height,
            fit: BoxFit.contain,
          ),
        ],
      ],
    );
  }
}

class LoadingTextIcon {
  final String icon;
  final double? width;
  final double? height;
  final double? size;
  final Color? color;
  final bool isColorDynamic;

  LoadingTextIcon({
    required this.icon,
    this.width,
    this.height,
    this.size,
    this.color,
    this.isColorDynamic = false,
  }) {
    if (isColorDynamic) {
      assert(color == null);
    }
  }
}
