class AdminNotificationModel {
  final String title;
  final String body;
  final bool isSeen;
  final String docId;

  AdminNotificationModel({
    required this.title,
    required this.body,
    required this.isSeen,
    required this.docId,
  });

  // Convert model to Firestore Map
  Map<String, dynamic> toFirebase() {
    return {'title': title, 'body': body, 'isSeen': isSeen, 'docId': docId};
  }

  // Create model from Firestore Document
  factory AdminNotificationModel.fromfirebase(Map<String, dynamic> map) {
    return AdminNotificationModel(
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      isSeen: map['isSeen'] ?? false,
      docId: map['docId'] ?? '',
    );
  }
}
