// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soda_bar/models/categroies_model.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class CategoriesProvider with ChangeNotifier {
  final firebase = FirebaseFirestore.instance;
  bool isLoading = false;
  List<CategoriesModel> categoriesList = [];

  Future getCategories(BuildContext context) async {
    try {
      isLoading = true;
      QuerySnapshot snapshot = await firebase.collection('categories').get();
      categoriesList.clear();
      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final category = CategoriesModel.fromFirestore(data, doc.id);
        categoriesList.add(category);
      }
      
      notifyListeners();
    } catch (e) {
      
      ToastUtil.showToast(context, message: e.toString());
    } finally {
      isLoading = false;
    }
  }
}
