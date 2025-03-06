import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({super.key, required this.text, required this.logo});
final String text ;
final String logo ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 56,
        width: 275,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor,
          boxShadow: const [BoxShadow(
              color: Color(0xFFD3D4E2),
              offset: Offset(15, 0),
              blurRadius: 30,
              spreadRadius: 0
          )],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(logo),
            Text(text,style: getSmallTextStyle(),)
          ],
        ),
      ),
    );
  }
}
