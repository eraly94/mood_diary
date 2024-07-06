import 'package:flutter/material.dart';
import 'package:mood_diary/core/theme/app_colors.dart';
import 'package:mood_diary/core/theme/app_styles.dart';

class GlButton extends StatelessWidget {
  const GlButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.style,
  });

  final String text;
  final Function() onPressed;
  final double? width;
  final double? height;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 47,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.tangerine,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: style ??
              AppStyles.w500f16.copyWith(
                color: AppColors.white,
              ),
        ),
      ),
    );
  }
}
