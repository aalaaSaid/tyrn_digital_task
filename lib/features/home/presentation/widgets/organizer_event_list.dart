import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_bloc.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_states.dart';

import '../screens/event_screen.dart';
import 'event_list_item.dart';
class OrganizerEventList extends StatefulWidget {
  const OrganizerEventList({super.key});

  @override
  State<OrganizerEventList> createState() => _OrganizerEventListState();
}

class _OrganizerEventListState extends State<OrganizerEventList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    var organizerModel=context.read<HomeBloc>().organizerModel?.data;
    return ListView.separated(
        itemBuilder: (context, index){
          return EventListItem(
              padding: 0,
              isShowLocation: false,
              url:organizerModel?.events?[index].picture??'',
              title:organizerModel?.events?[index].title??'',
              date:getDateAndTime(organizerModel?.events?[index].date??DateTime.now()),
              onTap: (){});
        },
        separatorBuilder: (context, index){
          return const Gap(10);
        },
        itemCount: organizerModel?.events?.length??0);
  },
);
  }
}
