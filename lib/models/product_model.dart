class ProductModel {
  String? id;
  String? name;
  String? image;
  double? price;
  String? flavor;
  int? quantity;
  String? category;
  String? categoryId;
  double? rating;
  String? addedDate;
  String? updatedDate;
  String? size;

  ProductModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.flavor,
    this.quantity,
    this.category,
    this.categoryId,
    this.rating,
    this.addedDate,
    this.updatedDate,
    this.size,
  });

  /// ✅ SAFE: Parses even if Firestore returns string instead of double/int
  ProductModel.fromFirestore(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];

    price = json['price'] is double
        ? json['price']
        : double.tryParse(json['price'].toString());

    flavor = json['flavor'];

    quantity = json['quantity'] is int
        ? json['quantity']
        : int.tryParse(json['quantity'].toString());

    category = json['category'];
    categoryId = json['categoryId'];

    rating = json['rating'] is double
        ? json['rating']
        : double.tryParse(json['rating'].toString());

    addedDate = json['addedDate'];
    updatedDate = json['updatedDate'];
    size = json['size'];
  }

  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['flavor'] = flavor;
    data['quantity'] = quantity;
    data['category'] = category;
    data['categoryId'] = categoryId;
    data['rating'] = rating;
    data['addedDate'] = addedDate;
    data['updatedDate'] = updatedDate;
    data['size'] = size;
    return data;
  }
}
