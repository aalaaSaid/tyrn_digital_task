import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_turn_digital/core/utils/app_colors.dart';

import '../../../../core/utils/text_styles.dart';
class CustomRowDrawer extends StatelessWidget {
   const CustomRowDrawer({super.key, required this.text, required this.icon});
   final String text;
   final IconData icon ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.greyColor,),
          const Gap(20),
          Text(text,style: getSmallTextStyle(),)
        ],
      ),
    );
  }
}
