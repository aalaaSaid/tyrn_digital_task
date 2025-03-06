import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_turn_digital/features/home/presentation/screens/event_details.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/text_styles.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../bloc/home_states.dart';
import '../widgets/event_list_item.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    context.read<HomeBloc>().add(GetEvents());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<HomeBloc>().add(GetEvents());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text('Events', style: getBodyTextStyle(fontSize: 20)),
        actions: const [Icon(Icons.search), Gap(5), Icon(Icons.more_vert)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            var eventModel = context
                .read<HomeBloc>()
                .eventModel
                ?.data
                ?.events;
            return Skeletonizer(
              enabled: state is! GetEventsSuccessState,
              child: ListView.separated(
                controller: _scrollController,
                  itemBuilder: (context, index) {
                    if (index == eventModel!.length) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return EventListItem(
                      isShowLocation: true,
                        onTap: () {
                          navigateTO(context, EventDetails(
                            eventId: eventModel[index].eventId.toString(),
                          ));
                        },
                        url: eventModel[index].picture ?? '',
                        title: eventModel[index].title ?? '',
                        date:getDateAndTime(eventModel[index].date ?? DateTime.now()) ,
                        address: eventModel[index].address ?? '');
                  },
                  separatorBuilder: (context, index) {
                    return const Gap(10);
                  },
                  itemCount: eventModel?.length ?? 0),
            );
          },
        ),
      ),
    );
  }
}
getDateAndTime(DateTime date) {
  return DateFormat('EEE, MMM d • hh:mm a').format(date);
}