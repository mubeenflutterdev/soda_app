// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/provider/feature_provider/user_info_provider.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class ProfileProvider with ChangeNotifier {
  Future<String?> uploadUserProfileImage(BuildContext context) async {
    final userProvider = Provider.of<UserInfoProvider>(context, listen: false);
    try {
      final picker = ImagePicker();

      // Ask user to choose from gallery or camera
      final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery, // Change to ImageSource.camera if needed
        imageQuality: 75,
      );

      if (pickedImage == null) {
        ToastUtil.showToast(context, message: 'No image selected.');
        return null;
      }

      File imageFile = File(pickedImage.path);

      // Create a unique path (e.g., with timestamp or user ID)
      final fileName = FirebaseAuth.instance.currentUser!.uid.toString();
      final storageRef = FirebaseStorage.instance.ref().child(
        "images/userProfileImage/$fileName.jpg",
      );

      // Upload file
      UploadTask uploadTask = storageRef.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;

      // Get download URL
      String downloadURL = await snapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'profileImage': downloadURL});
      print("Image uploaded. URL: $downloadURL");
      userProvider.getUserInfo(context);

      return downloadURL;
    } catch (e) {
      print('Upload error: $e');
      ToastUtil.showToast(context, message: 'Error: ${e.toString()}');
      return null;
    }
  }
}
