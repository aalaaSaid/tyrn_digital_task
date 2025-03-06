import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import 'list_of_users.dart';
class EventDetailsHeader extends StatelessWidget {
  const EventDetailsHeader({super.key, required this.url, required this.numOfGoing});
  final String url ;
  final String numOfGoing ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        CachedNetworkImage(
          width: double.infinity,
          fit: BoxFit.cover,
          height: 244,
          imageUrl: url,
          placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
          const Icon(Icons.error),
        ),
        Positioned(
          bottom: 0,
          left: 40,
          right: 40,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.whiteColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0xff5A5A5A),
                    offset: Offset(0, 20),
                  )
                ]),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const ListOfUsers(),
                const Gap(10),
                Text(
                  '+$numOfGoing Going',
                  style: getSmallTextStyle(
                      color: AppColors.primaryColor),
                ),
                const Spacer(),
                CustomButton(
                    height: 45,
                    width: 85,
                    text: 'Invite',
                    onPressed: () {},
                    color: AppColors.primaryColor),
              ],
            ),
          ),
        )
      ],
    );
  }
}
