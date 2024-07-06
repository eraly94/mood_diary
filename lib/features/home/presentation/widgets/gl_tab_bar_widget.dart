// ignore_for_file: use_named_constants

import 'package:flutter/material.dart';
import 'package:mood_diary/core/theme/app_colors.dart';
import 'package:mood_diary/core/theme/app_styles.dart';

class GlTabBarWidget extends StatelessWidget {
  const GlTabBarWidget({
    super.key,
    required this.tabController,
    required this.tabBarItem1,
    required this.tabBarItem2,
  });

  final TabController tabController;
  final String tabBarItem1;
  final String tabBarItem2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TabBar(
      labelPadding: const EdgeInsets.all(0.0),
      controller: tabController,
      labelStyle: AppStyles.w500f12,
      labelColor: AppColors.white,
      indicatorColor: Colors.transparent,
      unselectedLabelColor: AppColors.grey,
      dividerColor: Colors.transparent,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      tabs: List.generate(2, (index) {
        return AnimatedBuilder(
          animation: tabController,
          builder: (context, child) {
            return Container(
              margin: EdgeInsets.only(right: index == 0 ? 10 : 0),
              height: 40,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                color: tabController.index == index
                    ? AppColors.tangerine
                    : AppColors.grey4,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  index == 0 ? tabBarItem1 : tabBarItem2,
                  style: AppStyles.w400f16.copyWith(
                    color: tabController.index == index
                        ? AppColors.white
                        : AppColors.grey,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
