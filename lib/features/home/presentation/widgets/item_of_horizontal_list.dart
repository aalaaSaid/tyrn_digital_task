import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:task_turn_digital/features/home/presentation/widgets/list_of_users.dart';

import '../../../../core/functions/date_and_time.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class ItemOfHorizontalListview extends StatefulWidget {
  const ItemOfHorizontalListview(
      {super.key,
      required this.url,
      required this.title,
      required this.date,
      required this.going,
      required this.address});
  final String url;
  final String title;
  final DateTime date;
  final String going;
  final String address;

  @override
  State<ItemOfHorizontalListview> createState() => _ItemOfHorizontalListviewState();
}

class _ItemOfHorizontalListviewState extends State<ItemOfHorizontalListview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 255,
      width: 238,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: const Color(0xff505588).withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 8),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                height: 131,
                width: 218,
                fit: BoxFit.cover,
                imageUrl: widget.url,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
                left: 20,
                top: 10,
                child: Container(
                  height: 45,
                  width: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.whiteColor.withOpacity(.5),
                      boxShadow: const [BoxShadow(blurRadius: 6)]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        getDay(widget.date),
                        style: getBodyTextStyle(
                            color: AppColors.primaryColor, fontSize: 19),
                      ),
                      Text(
                        getMonth(widget.date),
                        style: getSmallTextStyle(
                            color: AppColors.primaryColor, fontSize: 9),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    ],
                  ),
                )),
            Positioned(
                right: 20,
                top: 10,
                child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteColor.withOpacity(.5),
                        boxShadow: const [BoxShadow(blurRadius: 6)]),
                    child: const Icon(
                      Icons.bookmark,
                      color: AppColors.primaryColor,
                    )))
          ]),
          const Gap(10),
          //title
          Text(
            widget.title,
            style: getBodyTextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const Gap(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ListOfUsers(),
              const Gap(5),
              Text(
                '+${widget.going} Going',
                style: getSmallTextStyle(
                    fontSize: 12, color: AppColors.primaryColor),
              )
            ],
          ),
          const Gap(15),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: AppColors.greyColor.withOpacity(.5),
              ),
              const Gap(5),
              Text(
                widget.address,
                style: getSmallTextStyle(
                    fontSize: 12, color: AppColors.greyColor.withOpacity(.5)),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          )
        ],
      ),
    );
  }
}


