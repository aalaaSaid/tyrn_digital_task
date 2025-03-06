import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../widgets/custom_title.dart';
import '../widgets/home_header.dart';
import '../widgets/horizntal_list_of_events.dart';
import '../widgets/invite_container.dart';
import '../widgets/my_drawer.dart';
import 'event_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Current Location',
                  style: getSmallTextStyle(
                      color: AppColors.whiteColor.withOpacity(.5)),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.whiteColor.withOpacity(.5),
                )
              ],
            ),
            Text(
              'New Yourk, USA',
              style: getSmallTextStyle(color: AppColors.whiteColor),
            )
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.blackColor.withOpacity(.2),
            child: const Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  color: AppColors.whiteColor,
                ),
                Positioned(
                  left: 10,
                  bottom: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    radius: 4,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          const HomeHeader(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Gap(20),
                CustomTitle(text: 'Upcoming Events',onTap:(){
                  navigateTO(context, const EventScreen());
                },),
                const Gap(20),
                const HorizntalListOfEvents(),
                const Gap(20),
                const InviteContainer(),
                const Gap(20),
                const CustomTitle(text: 'Nearby You'),


              ],
            ),
          )


        ],
      ),

    );
  }
}
