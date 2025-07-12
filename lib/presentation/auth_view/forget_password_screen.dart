import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:soda_bar/provider/feature_provider/auth_provider.dart';
import 'package:soda_bar/widgets/buttons/button_component.dart';
import 'package:soda_bar/widgets/text_field/text_form_field_component.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController forgetPasswordControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final forgetProvider = Provider.of<AuthentactionProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 184.h),
                Text('Reset Password', style: TextStyle(fontSize: 39.sp)),
                SizedBox(height: 10.h),

                Text(
                  'Please enter your email to receive a password\n reset link',
                  style: TextStyle(fontSize: 12.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),

                TextFormFieldComponent(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  text: 'Email:',
                  contentPaddingHeiht: 1,
                  contentPaddingWidth: 100,
                  controler: forgetPasswordControler,
                ),
                SizedBox(height: 50.h),

                ButtonComponent(
                  text: 'Send',
                  borderRadius: 10,
                  ontap: () {
                    String email = forgetPasswordControler.text
                        .trim()
                        .toString();
                         if (_formKey.currentState!.validate()) {
                    forgetProvider.forgetPassord(email, context);
                    
                    
                  }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
