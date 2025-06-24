// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:soda_bar/const/app_colors.dart';

class TextFormFieldComponent extends StatefulWidget {
  final String text;
  final double contentPaddingWidth;
  final double contentPaddingHeiht;

  double radius;
  IconData? sufficIcon;

  TextEditingController controler = TextEditingController();

  TextFormFieldComponent({
    super.key,
    required this.text,
    required this.contentPaddingWidth,
    required this.contentPaddingHeiht,
    required this.controler,
    this.radius = 2,
    this.sufficIcon,
  });

  @override
  State<TextFormFieldComponent> createState() =>
      _TextInputFieldComponentState();
}

class _TextInputFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.contentPaddingWidth * 0.05,
      ),
      child: TextFormField(
        controller: widget.controler,
        decoration: InputDecoration(
          /// suffix here
          suffixIcon: Icon(widget.sufficIcon),
          filled: true,
          fillColor: AppColors.primaryColor,
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
