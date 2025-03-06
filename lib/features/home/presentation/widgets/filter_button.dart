import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: 80,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.whiteColor,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xffA29EF0),
              child: Icon(Icons.filter_list,color: AppColors.whiteColor,),
            ),
            Text('Filter',style: getSmallTextStyle(color: AppColors.primaryColor,fontSize: 12),)
          ]
      ),

    );
  }
}
