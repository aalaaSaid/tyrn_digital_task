import 'dart:convert';

class EventModel {
  bool? success;
  String? message;
  Data? data;

  EventModel({
    this.success,
    this.message,
    this.data,
  });

  factory EventModel.fromRawJson(String str) => EventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? currentPage;
  int? pageSize;
  int? totalItems;
  int? totalPages;
  List<Event>? events;

  Data({
    this.currentPage,
    this.pageSize,
    this.totalItems,
    this.totalPages,
    this.events,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    pageSize: json["page_size"],
    totalItems: json["total_items"],
    totalPages: json["total_pages"],
    events: json["events"] == null ? [] : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "page_size": pageSize,
    "total_items": totalItems,
    "total_pages": totalPages,
    "events": events == null ? [] : List<dynamic>.from(events!.map((x) => x.toJson())),
  };
}

class Event {
  int? eventId;
  String? picture;
  DateTime? date;
  String? title;
  String? address;
  int? numberOfGoing;
  Organizer? organizer;

  Event({
    this.eventId,
    this.picture,
    this.date,
    this.title,
    this.address,
    this.numberOfGoing,
    this.organizer,
  });

  factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    eventId: json["event_id"],
    picture: json["picture"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    title: json["title"],
    address: json["address"],
    numberOfGoing: json["number_of_going"],
    organizer: json["organizer"] == null ? null : Organizer.fromJson(json["organizer"]),
  );

  Map<String, dynamic> toJson() => {
    "event_id": eventId,
    "picture": picture,
    "date": date?.toIso8601String(),
    "title": title,
    "address": address,
    "number_of_going": numberOfGoing,
    "organizer": organizer?.toJson(),
  };
}

class Organizer {
  int? id;
  String? name;
  String? picture;

  Organizer({
    this.id,
    this.name,
    this.picture,
  });

  factory Organizer.fromRawJson(String str) => Organizer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Organizer.fromJson(Map<String, dynamic> json) => Organizer(
    id: json["id"],
    name: json["name"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "picture": picture,
  };
}
