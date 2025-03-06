import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
class OrganizerHeader extends StatelessWidget {
  const OrganizerHeader({super.key, required this.url, required this.followers, required this.following, required this.name});
final String url;
final String followers;
final String following;
final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: SizedBox.expand(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:url ,
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        const Gap(20),
        Text(name,style: getBodyTextStyle(
            fontSize: 24
        ),),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(following,style: getBodyTextStyle(),),
                Text('Following',style: getSmallTextStyle(
                    fontSize: 14,
                    color: AppColors.greyColor.withOpacity(.5)
                ),)
              ],
            ),
            SizedBox(
              height: 20,
              child: VerticalDivider(
                color: AppColors.greyColor.withOpacity(.5),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(followers,style: getBodyTextStyle(),),
                Text('Followers',style: getSmallTextStyle(
                    fontSize: 14,
                    color: AppColors.greyColor.withOpacity(.5)
                ),)
              ],
            ),
          ],
        ),
      ],

    );
  }
}
