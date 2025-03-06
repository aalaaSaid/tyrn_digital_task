import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class CustomNavigationButton extends StatelessWidget {
  const CustomNavigationButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.radius,
  });
  final String text;
  final Function() onPressed;
  final double? width;
  final double? radius;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height ?? 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius?? 15),
          color: AppColors.primaryColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0xff6F7EC9),
              blurRadius: 35,
              offset: Offset(0, 10),

            ),

          ]
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Text(
              text,
              style: getTitleTextStyle(color: AppColors.whiteColor, fontSize: 16),
            ),
            const CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.whiteColor,
                child: Icon(Icons.arrow_forward,color: AppColors.primaryColor,))
          ],
        ),
      ),
    );

  }
}