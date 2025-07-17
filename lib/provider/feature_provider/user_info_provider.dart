// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:soda_bar/models/user_model.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class UserInfoProvider with ChangeNotifier {
  final firebase = FirebaseFirestore.instance;
  UserModel? userInfo;
  Future addUserInfo(
    String userId,
    String name,
    String email,
    String profileImage,
    DateTime lastLogin,
    DateTime updatedAt,
    BuildContext context,
  ) async {
    try {
      UserModel userModel = UserModel(
        uid: userId,
        name: name,
        email: email,
        profileImage: profileImage,
        createdAt: DateTime.now(),
        lastLogin: lastLogin,
        deviceToken: 'deviceToken',
        updatedAt: updatedAt,
      );

      firebase.collection('users').doc(userId).set(userModel.toFirestore());
    } catch (e) {
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    }
  }

  Future getUserInfo(BuildContext context) async {
    var userUid = FirebaseAuth.instance.currentUser!.uid;
    // QuerySnapshot snapshot = firebase.collection('users').doc().snapshots();
    try {
      DocumentSnapshot snapshot = await firebase
          .collection('users')
          .doc(userUid)
          .get();

      userInfo = UserModel.fromFirestore(
        snapshot.data() as Map<String, dynamic>,
        userUid,
      );
      notifyListeners();
    } catch (e) {
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    }
  }

  Future updateName(String name, BuildContext context) async {
    try {
      final userUid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(userUid).update({
        'name': name,
      });
      getUserInfo(context);
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
    }
  }
}
