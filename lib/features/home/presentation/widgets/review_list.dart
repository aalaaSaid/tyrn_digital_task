import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_bloc.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_states.dart';

import '../../../../core/functions/date_and_time.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        var organizerModel = context.read<HomeBloc>().organizerModel?.data;
        return ListView.builder(
            itemCount: organizerModel?.reviews?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: SizedBox.expand(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: organizerModel
                                ?.reviews?[index]
                                .reviewerPicture ??
                                '',
                            placeholder: (context, url) =>
                            const Center(
                                child:
                                CircularProgressIndicator()),
                            errorWidget:
                                (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Text(
                                  organizerModel
                                      ?.reviews?[index]
                                      .reviewerName ??
                                      '',
                                  style: getBodyTextStyle(
                                      fontSize: 18)),
                              Text(
                                getDayAndMonth(organizerModel
                                    ?.reviews?[index]
                                    .reviewDate ??
                                    DateTime.now()),
                                style: getSmallTextStyle(
                                    fontSize: 12,
                                    color: AppColors.greyColor
                                        .withOpacity(.5)),
                              )
                            ],
                          ),
                          const Gap(5),
                          RatingBar.builder(
                            initialRating: (organizerModel
                                ?.reviews?[index]
                                .rate ??
                                0)
                                .toDouble(),
                            direction: Axis.horizontal,
                            minRating: 1,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                            const EdgeInsets.symmetric(
                                horizontal: 4.0),
                            itemBuilder: (context, _) =>
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          const Gap(5),
                          Text(
                              organizerModel?.reviews?[index]
                                  .review ??
                                  '',
                              style: getSmallTextStyle(
                                  fontSize: 12)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            });
      },
    );
  }
}
