class DashboardModel {
  String? img;

  String? name;
  int? discount;

  DashboardModel({required this.img, this.name, required this.discount});

  /// Create NotificationModel from Firestore map
  DashboardModel.fromFirestore(json) {
    img = json['img'];

    name = json['name'];
    discount = json['discount'] ?? 39;
  }

  /// Convert NotificationModel to Firestore map
  Map<String, dynamic> toFirestore() {
    return {'type': name, 'discount': discount, 'img': img};
  }
}
