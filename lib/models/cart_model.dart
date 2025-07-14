class CartModel {
  String id;
  String name;
  String image;
  double price;
  String flavor;
  int quantity;
  String category;
  String categoryId;
  double rating;
  String addedDate;
  String updatedDate;
  String size;
  String cartId;

  CartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.flavor,
    required this.quantity,
    required this.category,
    required this.categoryId,
    required this.rating,
    required this.addedDate,
    required this.updatedDate,
    required this.size,
    required this.cartId,
  });

  /// ✅ SAFE: Parses with basic type checks
  CartModel.fromFirestore(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      image = json['image'],
      price = json['price'] is double
          ? json['price']
          : double.parse(json['price'].toString()),
      flavor = json['flavor'],
      quantity = json['quantity'] is int
          ? json['quantity']
          : int.parse(json['quantity'].toString()),
      category = json['category'],
      categoryId = json['categoryId'],
      rating = json['rating'] is double
          ? json['rating']
          : double.parse(json['rating'].toString()),
      addedDate = json['addedDate'],
      updatedDate = json['updatedDate'],
      size = json['size'],
      cartId = json['cartId'];

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'flavor': flavor,
      'quantity': quantity,
      'category': category,
      'categoryId': categoryId,
      'rating': rating,
      'addedDate': addedDate,
      'updatedDate': updatedDate,
      'size': size,
      'cartId': cartId,
    };
  }
}
