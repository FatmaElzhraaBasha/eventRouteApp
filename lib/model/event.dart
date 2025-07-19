class Event {
  static const String collectionName = 'Events';
  String id;
  String image;
  String title;
  String description;
  String eventName;
  DateTime dateTime;
  String time;
  bool isFavorite;

  Event({
    this.id = '',
    required this.title,
    required this.description,
    required this.dateTime,
    required this.eventName,
    required this.image,
    required this.time,
    this.isFavorite = false,
  });

  //todo: json => object
  Event.fromFireStore(Map<String, dynamic> data)
    : this(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
        eventName: data['eventName'],
        image: data['image'],
        time: data['time'],
        isFavorite: data['isFavorite'],
      );

  //todo: object => json
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'eventName': eventName,
      'image': image,
      'time': time,
      'isFavorite': isFavorite,
    };
  }
}
