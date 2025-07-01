import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/presentation/auth_view/forget_password_screen.dart';
import 'package:soda_bar/presentation/auth_view/sign_up_screen.dart';
import 'package:soda_bar/provider/feature_provider/auth_provider.dart';
import 'package:soda_bar/widgets/buttons/button_component.dart';
import 'package:soda_bar/widgets/buttons/google_button_component.dart';
import 'package:soda_bar/widgets/text_field/text_form_field_component.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<AuthentactionProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Text('Sign in', style: TextStyle(fontSize: 32.sp)),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  'Please Sign in with your\naccount',
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
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
                contentPaddingHeiht: 20,
                contentPaddingWidth: 20,
                controler: emailControler,
                radius: 9.r,
              ),
              SizedBox(height: 10.h),

              TextFormFieldComponent(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                text: 'Password:',
                contentPaddingHeiht: 20,
                contentPaddingWidth: 20,
                controler: passwordControler,
                radius: 9.r,
                sufficIcon: Icons.visibility_off,
              ),

              Padding(
                padding: EdgeInsets.only(left: 180.w, top: 10.h, bottom: 10.h),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Forget Password ?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: AppColors.buttonBackGround,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              ButtonComponent(
                height: 60.h,
                text: 'Sign In',
                borderRadius: 9.r,
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                    String email = emailControler.text.trim();
                    String password = passwordControler.text.trim();
                    signInProvider.signInUser(email, password, context);
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  children: [
                    Expanded(child: Divider(thickness: 1.5)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text('OR'),
                    ),
                    Expanded(child: Divider(thickness: 1.5)),
                  ],
                ),
              ),
              SizedBox(height: 15.h),

              GoogleButtonComponent(
                text: 'Continue with google',
                borderRadius: 5,
                ontap: () {},
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Didn’t have an account?  ',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      'SignUp  ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
