import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soda_bar/presentation/auth_view/sign_up_screen.dart';
import 'package:soda_bar/widgets/buttons/button_component.dart';
import 'package:soda_bar/widgets/text_field/text_form_field_component.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController forgetPasswordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
