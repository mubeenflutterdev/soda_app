class SodaModel {
  final String docId;
  final String userId;
  final String title;
  final String description;
  final String dateTime;
  final String img;

  SodaModel({
    required this.docId,
    required this.userId,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.img,
  });

  // Convert Firestore data to Dart object
  factory SodaModel.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return SodaModel(
      docId: documentId,
      userId: data['userId'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      dateTime: data['dateTime'] ?? '',
      img: data['img'] ?? '',
    );
  }

  // Convert Dart object to Firestore map
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'img': img,
    };
  }
}
