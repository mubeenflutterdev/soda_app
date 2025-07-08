import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:soda_bar/models/product_model.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> products = [];
  bool? isLoading;
  Future getProducts(BuildContext context) async {
    try {
      isLoading = true;
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('products')
          .get();

      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final products_data = ProductModel.fromFirestore(data);
        products.add(products_data);
      }
    } catch (e) {
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    } finally {
      isLoading = false;
    }
  }
}
