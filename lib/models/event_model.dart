class EventModel {
  String id;
  String title;
  String description;
  String category;
  String location;
  int date;
  bool isDone;
  bool isFavorite;
  String userId;

  EventModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.category,
    required this.userId,
    this.location = "",
    required this.date,
    this.isDone = false,
    this.isFavorite = true,
  });

  /// convert from map to json(model)
  /// take map and return model;
  EventModel.fromJson(Map<String, dynamic> json)
      : this(
          // returned Event model
          id: json['id']! as String,
          title: json['title']! as String,
          description: json['description']! as String,
          category: json['category']! as String,
          userId: json['userId']! as String,
          location: json['location']! as String,
          date: json['date']! as int,
          isDone: json['isDone']! as bool,
          isFavorite: json['isFavorite']! as bool,
        );

  /// convert from json(model) to map
  /// return map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'userId': userId,
      'location': location,
      'date': date,
      'isDone': isDone,
      'isFavorite': isFavorite,
    };
  }
}
