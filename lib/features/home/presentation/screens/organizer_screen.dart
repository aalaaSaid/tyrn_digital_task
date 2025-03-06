
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_turn_digital/core/utils/app_colors.dart';
import 'package:task_turn_digital/core/utils/text_styles.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_bloc.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_events.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_states.dart';
import 'package:task_turn_digital/features/home/presentation/widgets/organizer_event_list.dart';
import 'package:task_turn_digital/features/home/presentation/widgets/organizer_header.dart';
import 'package:task_turn_digital/features/home/presentation/widgets/orgnizer_button.dart';
import 'package:task_turn_digital/features/home/presentation/widgets/review_list.dart';

class OrganizerScreen extends StatefulWidget {
  const OrganizerScreen({super.key, required this.organizerId});
  final String organizerId;

  @override
  State<OrganizerScreen> createState() => _OrganizerScreenState();
}

class _OrganizerScreenState extends State<OrganizerScreen> {
  @override
  void initState() {
    context
        .read<HomeBloc>()
        .add(GetOrganizerEvents(organizerId: widget.organizerId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          var organizerModel = context.read<HomeBloc>().organizerModel?.data;
          return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert))
                ],
              ),
              body: Skeletonizer(
                enabled: state is !GetOrganizerDetailsSuccessState,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(children: [
                    OrganizerHeader(
                        url: organizerModel?.picture ?? '',
                        followers:
                            organizerModel?.numberOfFollowers.toString() ?? '',
                        following:
                            organizerModel?.numberOfFollowing.toString() ?? '',
                        name: organizerModel?.name ?? ''),
                    const Gap(20),
                    const Row(
                      children: [
                        OrganizerButton(
                          text: 'Follow',
                          icon: Icons.person_add_alt,
                          color: AppColors.primaryColor,
                        ),
                        Gap(10),
                        OrganizerButton(text: 'Message', icon: Icons.message),
                      ],
                    ),
                    const Gap(20),
                    const TabBar(
                        labelColor: AppColors.primaryColor,
                        unselectedLabelColor: AppColors.greyColor,
                        indicatorColor: AppColors.primaryColor,
                        tabs: [
                          Tab(
                            text: 'ABOUT',
                          ),
                          Tab(
                            text: 'EVENTS',
                          ),
                          Tab(
                            text: 'REVIEWS',
                          ),
                        ]),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: TabBarView(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: getSmallTextStyle(),
                                children: [
                                  TextSpan(
                                    text: organizerModel?.about ?? '',
                                    style: getSmallTextStyle(),
                                  ),
                                  TextSpan(
                                      text: 'Read More',
                                      style: getSmallTextStyle(
                                          color: AppColors.primaryColor)),
                                ],
                              ),
                            ),
                            const OrganizerEventList(),
                            const ReviewList(),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ));
        },
      ),
    );
  }
}
