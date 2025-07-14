// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';

import 'package:soda_bar/presentation/auth_view/sign_in_screen.dart';
import 'package:soda_bar/presentation/user_view/bottom_navigation_bar_screen.dart';

import 'package:soda_bar/provider/feature_provider/auth_provider.dart';
import 'package:soda_bar/provider/feature_provider/user_info_provider.dart';

import 'package:soda_bar/widgets/buttons/button_component.dart';
import 'package:soda_bar/widgets/buttons/google_button_component.dart';
import 'package:soda_bar/widgets/text_field/text_form_field_component.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confirmPasswordControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<AuthentactionProvider>(context);
    final userInfoProvider = Provider.of<UserInfoProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Center(
                child: Text('Sign Up', style: TextStyle(fontSize: 32.sp)),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  'Create an account to begin your Learning\nJourney',
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10.h),

              TextFormFieldComponent(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                text: 'Your Name Here:',
                contentPaddingHeiht: 20,
                contentPaddingWidth: 20,
                controler: nameControler,
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
                text: 'Your Email Here:',
                contentPaddingHeiht: 20,
                contentPaddingWidth: 20,
                controler: emailControler,
                radius: 9.r,
              ),
              SizedBox(height: 10.h),

              TextFormFieldComponent(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'data is required';
                  }
                  return null;
                },
                text: '*******************',
                contentPaddingHeiht: 20,
                contentPaddingWidth: 20,
                controler: passwordControler,
                radius: 9.r,
                sufficIcon: Icons.visibility_off,
              ),
              SizedBox(height: 10.h),

              TextFormFieldComponent(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                text: '*******************',
                contentPaddingHeiht: 20,
                contentPaddingWidth: 20,
                controler: confirmPasswordControler,
                radius: 9.r,
                sufficIcon: Icons.visibility_off,
              ),
              SizedBox(height: 20.h),

              ButtonComponent(
                text: 'Upload Profile Image',
                borderRadius: 20,
                ontap: () {},
              ),
              SizedBox(height: 20.h),
              Consumer<AuthentactionProvider>(
                builder: (context, provider, child) {
                  return GestureDetector(
                    onTap: () async {
                      String email = emailControler.text.trim();
                      String password = passwordControler.text.trim();
                      String name = nameControler.text.trim();
                      if (_formKey.currentState!.validate()) {
                        await signUpProvider.signUpUser(
                          name,
                          email,
                          password,
                          context,
                        );

                        // userInfoProvider.addUserInfo(, name, email, profileImage, lastLogin, updatedAt, context)
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Bottomnavigationbarscreen(),
                        //   ),
                        // );
                      }

                      // signUpProvider.signUpUser(email, password, context);
                    },

                    child: Container(
                      width: double.infinity,
                      height: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.buttonBackGround,
                      ),
                      child: provider.isSignUPLoading == true
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.whiteColor,
                              ),
                            )
                          : Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(color: AppColors.whiteColor),
                              ),
                            ),
                    ),
                  );
                },
              ),

              // ButtonComponent(
              //   height: 60.h,
              //   text: 'SIGN UP',
              //   borderRadius: 9.r,
              //   ontap: () async {
              //     String email = emailControler.text.trim();
              //     String password = passwordControler.text.trim();
              //     String name = nameControler.text.trim();
              //     if (_formKey.currentState!.validate()) {
              //       await signUpProvider.signUpUser(
              //         name,
              //         email,
              //         password,
              //         context,
              //       );

              //       // userInfoProvider.addUserInfo(, name, email, profileImage, lastLogin, updatedAt, context)
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => Bottomnavigationbarscreen(),
              //         ),
              //       );
              //     }

              //     // signUpProvider.signUpUser(email, password, context);
              //   },

              // ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  children: [
                    Expanded(child: Divider(thickness: 1.5)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text('OR Sign Up with'),
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
                    'Already have an account?  ',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: Text(
                      'Sign In  ',
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
