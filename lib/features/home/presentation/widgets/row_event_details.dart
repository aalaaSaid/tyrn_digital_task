import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_turn_digital/core/widgets/custom_button.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
class RowEventDetails extends StatelessWidget {
  const RowEventDetails({super.key,this.onPressed,this.textOfButton, this.icon,this.url, required this.title, required this.subtitle});
  final IconData? icon;
  final String? url;
  final String title;
  final String subtitle;
  final String? textOfButton;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primaryColor.withOpacity(.1),
            ),
            child: (icon!=null) ? Icon(icon,color: AppColors.primaryColor,):
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                imageUrl: url!,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            )
            ,
          ),
          const Gap(20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: getBodyTextStyle(fontSize: 16),),
              Text(subtitle,style: getSmallTextStyle(color: AppColors.greyColor.withOpacity(.7),fontSize: 12),),
            ],

          ),
          const Spacer(),
          if(textOfButton!=null) CustomButton(
              height: 45,
              width: 90,
              radius: 7,
              color: AppColors.primaryColor,
              foregroundColor: AppColors.whiteColor,
              text: textOfButton!, onPressed: (){})
        ],
      ),
    );
  }
}
