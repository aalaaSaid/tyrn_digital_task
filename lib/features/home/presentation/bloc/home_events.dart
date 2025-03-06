class HomeEvent{}

class GetEvents extends HomeEvent{}

class GetEventsDetails extends HomeEvent{
  String eventId;
  GetEventsDetails({required this.eventId});
}

class GetOrganizerEvents extends HomeEvent{
  String organizerId;
  GetOrganizerEvents({required this.organizerId});
}
