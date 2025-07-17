class NotificationModel {
  String? id;
  String? message;
  String? type;
  bool? isSeen;

  NotificationModel({this.id, this.message, this.type, this.isSeen});

  /// Create NotificationModel from Firestore map
  NotificationModel.fromFirestore(Map<String, dynamic> json, String docId) {
    id = docId;
    message = json['message'];
    type = json['type'];
    isSeen = json['isSeen'] ?? false;
  }

  /// Convert NotificationModel to Firestore map
  Map<String, dynamic> toFirestore() {
    return {
      'message': message,
      'type': type,
      'isSeen': isSeen,
    };
  }
}
