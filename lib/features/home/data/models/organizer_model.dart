import 'dart:convert';

class OrganizerModel {
  bool? success;
  String? message;
  Data? data;

  OrganizerModel({
    this.success,
    this.message,
    this.data,
  });

  factory OrganizerModel.fromRawJson(String str) => OrganizerModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrganizerModel.fromJson(Map<String, dynamic> json) => OrganizerModel(
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
  String? name;
  String? picture;
  int? numberOfFollowing;
  int? numberOfFollowers;
  String? about;
  List<Event>? events;
  List<Review>? reviews;

  Data({
    this.name,
    this.picture,
    this.numberOfFollowing,
    this.numberOfFollowers,
    this.about,
    this.events,
    this.reviews,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    picture: json["picture"],
    numberOfFollowing: json["number_of_following"],
    numberOfFollowers: json["number_of_followers"],
    about: json["about"],
    events: json["events"] == null ? [] : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
    reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "picture": picture,
    "number_of_following": numberOfFollowing,
    "number_of_followers": numberOfFollowers,
    "about": about,
    "events": events == null ? [] : List<dynamic>.from(events!.map((x) => x.toJson())),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
  };
}

class Event {
  int? id;
  String? picture;
  DateTime? date;
  String? title;

  Event({
    this.id,
    this.picture,
    this.date,
    this.title,
  });

  factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    picture: json["picture"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "picture": picture,
    "date": date?.toIso8601String(),
    "title": title,
  };
}

class Review {
  int? reviewId;
  String? reviewerPicture;
  String? reviewerName;
  int? rate;
  String? review;
  DateTime? reviewDate;

  Review({
    this.reviewId,
    this.reviewerPicture,
    this.reviewerName,
    this.rate,
    this.review,
    this.reviewDate,
  });

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    reviewId: json["review_id"],
    reviewerPicture: json["reviewer_picture"],
    reviewerName: json["reviewer_name"],
    rate: json["rate"],
    review: json["review"],
    reviewDate: json["review_date"] == null ? null : DateTime.parse(json["review_date"]),
  );

  Map<String, dynamic> toJson() => {
    "review_id": reviewId,
    "reviewer_picture": reviewerPicture,
    "reviewer_name": reviewerName,
    "rate": rate,
    "review": review,
    "review_date": reviewDate?.toIso8601String(),
  };
}
