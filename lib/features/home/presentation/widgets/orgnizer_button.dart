import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
class OrganizerButton extends StatelessWidget {
  const OrganizerButton({super.key, required this.text, required this.icon, this.color});
  final String text;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border:
            Border.all(color: AppColors.primaryColor),
            color:color?? AppColors.whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
               icon,
                color: color ==AppColors.primaryColor? AppColors.whiteColor:AppColors.primaryColor,
              ),
              const Gap(15),
              Text(
                text,
                style: getSmallTextStyle(
                    color:color ==AppColors.primaryColor? AppColors.whiteColor:AppColors.primaryColor, fontSize: 14),
              )
            ],
          )),
    );
  }
}
