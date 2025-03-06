import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../bloc/home_states.dart';
import 'item_of_horizontal_list.dart';
class HorizntalListOfEvents extends StatefulWidget {
  const HorizntalListOfEvents({super.key});

  @override
  State<HorizntalListOfEvents> createState() => _HorizntalListOfEventsState();
}

class _HorizntalListOfEventsState extends State<HorizntalListOfEvents> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetEvents());
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 260,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            var eventModel = context.read<HomeBloc>().eventModel?.data?.events;
            return Skeletonizer(
              enabled: state is !GetEventsSuccessState,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ItemOfHorizontalListview(
                        url: eventModel?[index].picture??'',
                        title: eventModel?[index].title??'',
                        date: eventModel?[index].date??DateTime.now(),
                        going: eventModel?[index].numberOfGoing.toString()??'',
                        address: eventModel?[index].address??'');
                  },
                  separatorBuilder: (context, index) {
                    return const Gap(20);
                  }, itemCount: eventModel?.length??0),
            );
          },
        ),
      );
  }
}
