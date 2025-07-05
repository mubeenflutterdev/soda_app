class CategoriesModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final String quantity;
  final String addedDate;
  final String updatedDate;
  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.quantity,
    required this.addedDate,
    required this.updatedDate,
  });

  // Convert Firestore data to Dart object
  factory CategoriesModel.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return CategoriesModel(
      id: documentId,
      name: data['name']?.toString() ?? '',
      image: data['image']?.toString() ?? '',
      description: data['description']?.toString() ?? '',
      quantity: data['quantity']?.toString() ?? '',
      addedDate: data['addedDate']?.toString() ?? '',
      updatedDate: data['updatedDate']?.toString() ?? '',
    );
  }

  // Convert Dart object to Firestore map
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'id': id,
      'description': description,
      'image': image,
      'quantity': quantity,
      'addedDate': addedDate,
      'updatedDate': updatedDate,
    };
  }
}
