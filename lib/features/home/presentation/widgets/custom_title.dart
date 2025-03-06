import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle( {super.key,required this.text, this.onTap});
final String text ;
final Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: getBodyTextStyle(fontSize: 18),),
        InkWell(
          onTap: onTap,
          child: Row(children: [
            Text('See All',style: getSmallTextStyle(fontSize: 14,color: AppColors.greyColor.withOpacity(.5)),),
            Icon(Icons.arrow_right,color: AppColors.greyColor.withOpacity(.5),)
          ],),
        )
      ],);
  }
}
