// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/provider/ui_provider/visibality_provider.dart';

class TextFormFieldComponent extends StatefulWidget {
  final String text;
  final double contentPaddingWidth;
  final double contentPaddingHeiht;
  final String? Function(String?)? validator;
  double radius;
  IconData? sufficIcon;
  bool? obsecure;

  TextEditingController controler = TextEditingController();

  TextFormFieldComponent({
    super.key,
    required this.text,
    required this.contentPaddingWidth,
    required this.contentPaddingHeiht,
    required this.controler,
    this.radius = 2,
    this.sufficIcon,
    this.validator,
    this.obsecure,
  });

  @override
  State<TextFormFieldComponent> createState() =>
      _TextInputFieldComponentState();
}

class _TextInputFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    VisibalityProvider visibalityProvider = Provider.of<VisibalityProvider>(
      context,
    );
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.contentPaddingWidth * 0.05,
      ),
      child: TextFormField(
        obscureText: widget.obsecure ?? false,
        validator: widget.validator,
        controller: widget.controler,
        decoration: InputDecoration(
          /// suffix here
          suffixIcon: GestureDetector(
            onTap: () {
              visibalityProvider.visibileTextFormField();
            },
            child: Icon(widget.sufficIcon),
          ),
          filled: true,
          fillColor: AppColors.whiteColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.contentPaddingHeiht,
            horizontal: widget.contentPaddingWidth,
          ),
          hintText: widget.text,
          hintStyle: TextStyle(fontSize: 13),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
        ),
      ),
    );
  }
}
