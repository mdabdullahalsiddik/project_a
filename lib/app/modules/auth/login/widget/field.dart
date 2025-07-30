import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodfinder/app/core/constant/app_color.dart';
import 'package:foodfinder/app/global_widgets/app_text.dart';
import 'package:foodfinder/app/global_widgets/text_field.dart';


class TextFieldColum extends StatelessWidget {
  const TextFieldColum({
    this.obscureText = false,
    super.key,
    this.onChanged,
    this.suffixIcon,
    this.validator,
    this.textInputAction,
    required this.title,
    this.hintText,
    required this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.isFilled,
    this.fillColor,
    this.prefixIcon,
  });

  final Function(String)? onChanged;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? isFilled;
  final Color? fillColor;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(left: 8.0), child:
        
         
         Row(
            children: [
             CustomText(title, size: 12, weight: FontWeight.w500),
              CustomText(" *", size: 16, weight: FontWeight.w600, color: AppColor.errorColor),
            ],
          ),
         
         ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: controller,
          hintText: hintText,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          isFilled: isFilled,
          fillColor: fillColor,
          maxLines: 1,
          prefixIcon: prefixIcon,
          obscureText: obscureText,
          onChanged: onChanged,
          textInputAction: textInputAction ?? TextInputAction.next,
          suffixIcon: suffixIcon,
          validator: validator,
        ),
      ],
    );
  }
}
