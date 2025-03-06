import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_events.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_states.dart';

import '../../data/models/event_details_model.dart';
import '../../data/models/event_model.dart';
import '../../data/models/organizer_model.dart';
import '../../data/repo/home_repo.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc() : super(HomeInitial()) {
    on<GetEvents>(getEvents);
    on<GetEventsDetails>(getEventsDetails);
    on<GetOrganizerEvents>(getOrganizer);
  }
  EventModel? eventModel;
  int currentPage = 1;
  int totalPages = 1;
  bool isFetching = false;
  Future<void>getEvents(GetEvents event , Emitter<HomeState> emit)async{
    if (currentPage > totalPages || isFetching) return;
    isFetching = true;
    emit(GetEventsLoadingState());
    await HomeRepo.getEvents(page: currentPage).then((value){
      if (value != null) {
        if (eventModel == null) {
          eventModel = value;
        } else {
          eventModel!.data!.events!.addAll(value.data!.events!);
        }
        currentPage++;
        totalPages = value.data!.totalPages!;
        emit(GetEventsSuccessState());
      } else {
        emit(GetEventsErrorState('Failed to load events.'));
      }
      isFetching = false;
    });
  }

  EventDetailsModel? eventDetailsModel;
  Future<void>getEventsDetails(GetEventsDetails event , Emitter<HomeState> emit)async{
   emit(GetEventDetailsLoadingState());
   await HomeRepo.getEventDetails(eventId: event.eventId).then((value){
     if(value!=null){
       eventDetailsModel = value;
       emit(GetEventDetailsSuccessState());
     }else{
       emit(GetEventDetailsErrorState(''));
     }
   });
  }

  OrganizerModel? organizerModel;
  Future<void>getOrganizer(GetOrganizerEvents event , Emitter<HomeState>emit)async{
    emit(GetOrganizerDetailsLoadingState());
    await HomeRepo.getOrganizer(organizerId: event.organizerId).then((value){
      if(value!=null){
        organizerModel = value;
        emit(GetOrganizerDetailsSuccessState());
      }else{
        emit(GetOrganizerDetailsErrorState(''));
      }
    });

  }

}