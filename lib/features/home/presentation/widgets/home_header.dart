import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_home_button.dart';
import 'filter_button.dart';
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none, children: [
      Container(
        height: 100,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(33),
              bottomRight: Radius.circular(33),
            )),
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: AppColors.primaryColor,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Search',
            hintStyle: getSmallTextStyle(
                color: AppColors.whiteColor.withOpacity(.5)),
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.whiteColor,
            ),
            suffixIcon: const FilterButton(),
          ),
        ),
      ),
      const Positioned(
          bottom: -25,
          left: 10,
          right: 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomHomeButton(color: Color(0xff862D28),
                  icon: Icons.sports_basketball,
                  text: 'Sports',
                  height: 41,
                  width: 110),
              CustomHomeButton(color: Color(0xff524037),
                  icon: Icons.music_note,
                  text: 'Music',
                  height: 40,
                  width: 102),
              CustomHomeButton(color: Color(0xff29D697),
                  icon: Icons.restaurant_menu,
                  text: 'Food',
                  height: 38,
                  width: 95),
            ],
          )),
    ]);
  }
}
