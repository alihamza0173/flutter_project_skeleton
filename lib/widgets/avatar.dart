import 'package:flutter/material.dart';

import '../core/colors.dart';
import '../extensions/double.dart';
import 'image.dart';

class Avatar extends StatelessWidget {
  final String initials;
  final String? profilePicture;
  final AvatarSize size;

  const Avatar({
    super.key,
    required this.initials,
    required this.profilePicture,
    required this.size,
  });

  @override
  Widget build(final BuildContext context) {
    final double circleSize;
    final double fontSize;
    switch (size) {
      case AvatarSize.s160:
        circleSize = 160;
        fontSize = 56;
        break;
      case AvatarSize.s120:
        circleSize = 120;
        fontSize = 44;
        break;
      case AvatarSize.s104:
        circleSize = 104;
        fontSize = 36;
        break;
      case AvatarSize.s80:
        circleSize = 80;
        fontSize = 32;
        break;
      case AvatarSize.s64:
        circleSize = 64;
        fontSize = 26;
        break;
      case AvatarSize.s56:
        circleSize = 56;
        fontSize = 26;
        break;
      case AvatarSize.s48:
        circleSize = 48;
        fontSize = 16;
        break;
      case AvatarSize.s32:
        circleSize = 32;
        fontSize = 14;
        break;
      case AvatarSize.s24:
        circleSize = 24;
        fontSize = 12;
        break;
      case AvatarSize.s20:
        circleSize = 20;
        fontSize = 10;
        break;
    }
    return ClipOval(
      child: SizedBox(
        width: circleSize.toBaseSize(),
        height: circleSize.toBaseSize(),
        child: ColoredBox(
          color: AppColors.primary,
          child:
              profilePicture == null
                  ? Center(
                    child: Text(
                      initials,
                      style: TextStyle(
                        fontVariations: const [FontVariation.weight(600)],
                        fontSize: fontSize.toBaseSize(),
                        // color: AppColors.content_text_onAccent,
                      ),
                    ),
                  )
                  : AppImage(profilePicture!),
        ),
      ),
    );
  }
}

enum AvatarSize { s160, s120, s104, s80, s64, s56, s48, s32, s24, s20 }
