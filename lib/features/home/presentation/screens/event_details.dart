import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_bloc.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_events.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_states.dart';
import 'package:task_turn_digital/features/home/presentation/screens/organizer_screen.dart';

import '../../../../core/functions/date_and_time.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_navigate_button.dart';
import '../widgets/event_details_header.dart';
import '../widgets/row_event_details.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key, required this.eventId});
  final String eventId;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetEventsDetails(eventId: widget.eventId));
    super.initState();
  }

  void _shareEvent() async {
    var eventData = context.read<HomeBloc>().eventDetailsModel?.data;

    if (eventData != null) {
      String eventTitle = eventData.title ?? 'Event';
      String eventAddress = eventData.address ?? 'No Address';
      String imageUrl = eventData.picture ?? '';

      String shareText =
          'Check out this event: $eventTitle\nLocation: $eventAddress\n';

      if (imageUrl.isNotEmpty) {
        try {
          final ByteData data =
              await NetworkAssetBundle(Uri.parse(imageUrl)).load("");
          final List<int> bytes = data.buffer.asUint8List();
          final tempDir = await getTemporaryDirectory();
          final file =
              await File('${tempDir.path}/event.jpg').writeAsBytes(bytes);
          Share.shareXFiles([XFile(file.path)], text: shareText);
        } catch (e) {
          Share.share(shareText);
        }
      } else {
        Share.share(shareText);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        var eventData = context.read<HomeBloc>().eventDetailsModel?.data;
        return SafeArea(
          child: Scaffold(
            body: Skeletonizer(
              enabled: state is! GetEventDetailsSuccessState,
              child: InkWell(
                onTap: _shareEvent,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      floating: false,
                      expandedHeight: 280,
                      foregroundColor: AppColors.whiteColor,
                      title: Text(
                        'Event Details',
                        style:
                            getSubTitleTextStyle(color: AppColors.whiteColor),
                      ),
                      centerTitle: false,
                      flexibleSpace: FlexibleSpaceBar(
                        background: EventDetailsHeader(
                            url: eventData?.picture ?? '',
                            numOfGoing:
                                eventData?.numberOfGoing.toString() ?? ''),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.whiteColor.withOpacity(.3),
                                boxShadow: const [BoxShadow(blurRadius: 17)]),
                            child: const Icon(
                              Icons.bookmark,
                              color: AppColors.whiteColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(25),
                            Text(
                              eventData?.title ?? '',
                              style: getBodyTextStyle(fontSize: 30),
                              textAlign: TextAlign.center,
                            ),
                            const Gap(20),
                            RowEventDetails(
                                icon: Icons.calendar_month,
                                title:
                                    getDate(eventData?.date ?? DateTime.now()),
                                subtitle:
                                    '${getDayName(eventData?.date ?? DateTime.now())},${getTime(
                                  eventData?.date ?? DateTime.now(),
                                )}'),
                            const Gap(20),
                            RowEventDetails(
                                icon: Icons.location_on,
                                title: eventData?.addressTitle ?? '',
                                subtitle: eventData?.address ?? ''),
                            const Gap(20),
                            RowEventDetails(
                              title: eventData?.organizer?.name ?? '',
                              subtitle: 'Organizer',
                              url: eventData?.organizer?.picture ?? '',
                              textOfButton: 'Follow',
                              onPressed: () {
                                navigateTO(
                                    context,
                                    OrganizerScreen(
                                      organizerId:
                                          eventData?.organizer?.id.toString() ??
                                              '',
                                    ));
                              },
                            ),
                            const Gap(20),
                            Text(
                              'About Event',
                              style: getBodyTextStyle(fontSize: 20),
                            ),
                            const Gap(15),
                            Text(
                              eventData?.aboutEvent ?? '',
                              style: getSmallTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: CustomNavigationButton(
                  height: 60,
                  width: 270,
                  text: 'Buy Ticket \$ ${eventData?.eventPrice ?? ''}',
                  onPressed: () {}),
            ),
          ),
        );
      },
    );
  }
}
