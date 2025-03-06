import 'package:flutter/material.dart';
import 'package:task_turn_digital/core/utils/app_colors.dart';

import '../utils/text_styles.dart';

class CustomHomeButton extends StatelessWidget {
   const CustomHomeButton({super.key, required this.color, required this.icon, required this.text, required this.height, required this.width});
   final Color color;
   final IconData icon;
   final String text;
   final double height;
   final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
        boxShadow:const [
          BoxShadow(
            color: Color(0xff2E2E4F),
            offset: Offset(0, 6),
            blurRadius: 20,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon , color: AppColors.whiteColor,size: 17,),
          Text(text, style: getSmallTextStyle(color: AppColors.whiteColor,fontSize: 15),)
        ],
      ),
    );
  }
}
