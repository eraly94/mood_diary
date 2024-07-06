import 'package:flutter/material.dart';
import 'package:mood_diary/core/theme/app_colors.dart';
import 'package:mood_diary/core/theme/app_styles.dart';

class WraptextWidget extends StatelessWidget {
  final String wrapText;
  final VoidCallback onTap;
  final bool isActive;

  const WraptextWidget({
    super.key,
    required this.wrapText,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: isActive ? AppColors.tangerine : AppColors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(wrapText,
            style: AppStyles.w400f11.copyWith(
              color: isActive ? Colors.white : Colors.black,
            )),
      ),
    );
  }
}
