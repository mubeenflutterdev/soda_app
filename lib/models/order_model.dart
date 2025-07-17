import 'package:soda_bar/models/product_model.dart';

class OrderModel {
  String? orderId;
  String? userId;
  List<ProductModel>? products;
  double? totalAmount;
  String? orderStatus;
  String? paymentMethod;
  String? address;
  String? placedAt;
  String? updatedAt;
  OrderModel({
    this.orderId,
    this.userId,
    this.products,
    this.totalAmount,
    this.orderStatus,
    this.paymentMethod,
    this.address,
    this.placedAt,
    this.updatedAt,
  });
  OrderModel.fromFirestore(Map<String, dynamic> json) {
    orderId = json['orderId'];
    userId = json['userId'];
    if (json['products'] != null) {
      products = (json['products'] as List)
          .map((e) => ProductModel.fromFirestore(Map<String, dynamic>.from(e)))
          .toList();
    }
    totalAmount = json['totalAmount'] is double
        ? json['totalAmount']
        : double.tryParse(json['totalAmount'].toString());
    orderStatus = json['orderStatus'];
    paymentMethod = json['paymentMethod'];
    address = json['address'];
    placedAt = json['placedAt'];
    updatedAt = json['updatedAt'];
  }
  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['userId'] = userId;
    data['products'] = products?.map((e) => e.toFirestore()).toList();
    data['totalAmount'] = totalAmount;
    data['orderStatus'] = orderStatus;
    data['paymentMethod'] = paymentMethod;
    data['address'] = address;
    data['placedAt'] = placedAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'Order(orderId: $orderId, totalAmount: $totalAmount, status: $orderStatus)';
  }
}
