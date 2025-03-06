class HomeState {}

class HomeInitial extends HomeState {}

class GetEventsSuccessState extends HomeState {}

class GetEventsErrorState extends HomeState {
  final String error;
  GetEventsErrorState(this.error);
}

class GetEventsLoadingState extends HomeState {}

class GetEventDetailsSuccessState extends HomeState {}

class GetEventDetailsErrorState extends HomeState {
  final String error;
  GetEventDetailsErrorState(this.error);
}

class LoadMoreEventsSuccessState extends HomeState {}
class LoadMoreEventsErrorState extends HomeState{
  final String error;
  LoadMoreEventsErrorState(this.error);
}
class LoadMoreEventsLoadingState extends HomeState {}

class GetEventDetailsLoadingState extends HomeState {}

class GetOrganizerDetailsLoadingState extends HomeState{}
class GetOrganizerDetailsErrorState extends HomeState{
  final String error;
  GetOrganizerDetailsErrorState(this.error);
}
class GetOrganizerDetailsSuccessState extends HomeState{}
