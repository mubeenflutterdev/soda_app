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

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    flavor = json['flavor'];
    quantity = json['quantity'];
    category = json['category'];
    categoryId = json['categoryId'];
    rating = json['rating'];
    addedDate = json['addedDate'];
    updatedDate = json['updatedDate'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['flavor'] = this.flavor;
    data['quantity'] = this.quantity;
    data['category'] = this.category;
    data['categoryId'] = this.categoryId;
    data['rating'] = this.rating;
    data['addedDate'] = this.addedDate;
    data['updatedDate'] = this.updatedDate;
    data['size'] = this.size;
    return data;
  }
}
