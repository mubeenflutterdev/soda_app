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
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'quantity': quantity,
      'addedDate': addedDate,
      'updatedDate': updatedDate,
    };
  }

  // Debug-friendly string representation
  @override
  String toString() {
    return 'CategoriesModel(id: $id, name: $name, image: $image, quantity: $quantity)';
  }

  // Optional: copyWith method for immutability
  CategoriesModel copyWith({
    String? id,
    String? name,
    String? image,
    String? description,
    String? quantity,
    String? addedDate,
    String? updatedDate,
  }) {
    return CategoriesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      addedDate: addedDate ?? this.addedDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }
}
