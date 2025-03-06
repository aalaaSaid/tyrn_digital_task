import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class EventListItem extends StatelessWidget {
  const EventListItem({super.key,this.padding, required this.url, required this.title, required this.date, this.address, required this.onTap, this.isShowLocation});
  final String url;
  final String title;
  final String date;
  final String? address;
  final Function() onTap;
  final bool? isShowLocation;
  final double? padding ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding?? 10),
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.whiteColor,
            boxShadow: const [
              BoxShadow(
                  color: Color(0xffABC2EB),
                  offset: Offset(0, 10),
                  blurRadius: 35)
            ]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                imageUrl: url,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(date,
                  style: getBodyTextStyle(
                      fontSize: 13, color: AppColors.primaryColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  title,
                  style: getBodyTextStyle(fontSize: 18),
                ),
       if(isShowLocation==true) Row(
          children: [
            Icon(
              Icons.location_on,
              color: AppColors.greyColor.withOpacity(.5),
            ),
            const Gap(5),
            Text(address!,
              style: getSmallTextStyle(
                  fontSize: 12,
                  color:
                  AppColors.greyColor.withOpacity(.5)),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
