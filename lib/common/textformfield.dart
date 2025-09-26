import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommercetask/constants/colors.dart';
import 'dimesions.dart';

class MyTextformField extends StatelessWidget {
  const MyTextformField({
    super.key,
    this.controller,
    this.validator,
    this.keyBoard,
    this.obscureText = false,
    this.suffix,
    this.enabled,
    this.maxLength,
    this.inputColor = Colors.black,
    this.hintText,
    this.textCapitalization = TextCapitalization.none,
    this.maxLine,
    this.prefix,
    this.filled = true,
    this.filledColor = Colors.white,
    this.onChanged,
    this.borderColor = Colors.transparent,
    this.vPadding = 12,
    this.inputFormatters,
    this.hintColor = const Color.fromRGBO(117, 117, 117, 1),
    this.cursorColor = themeColor,
    this.labelText,
    this.onFieldSubmitted,
    this.onTap,
    this.borderRadius = 12,
    this.borderWidth = 1,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyBoard;
  final bool? obscureText;
  final Widget? suffix;
  final bool? enabled;
  final bool? filled;
  final int? maxLength;
  final int? maxLine;
  final Color? inputColor;
  final Color? filledColor;
  final Color? borderColor;
  final Color? hintColor;
  final Color? cursorColor;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final Widget? prefix;
  final double? vPadding;
  final double? borderRadius;
  final double? borderWidth;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      enabled: enabled,
      maxLines: maxLine,
      style: TextStyle(
        color: inputColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      maxLength: maxLength,
      cursorColor: cursorColor,
      keyboardType: keyBoard,
      controller: controller,
      textCapitalization: textCapitalization!,
      validator: validator,
      obscureText: obscureText!,
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(
          fontSize: 20,
          color: Colors.grey.shade600,
          fontFamily: 'semibold',
        ),
        prefixIcon: prefix,
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 17,
          color: hintColor,
          fontFamily: 'medium',
        ),
        hintStyle: TextStyle(fontSize: 14, color: hintColor, fontFamily: ''),
        counterText: "",
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.03,
          vertical: vPadding!,
        ),
        suffixIcon: suffix,
        filled: filled,
        fillColor: filledColor,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(color: themeRed, width: borderWidth!),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(color: borderColor!, width: borderWidth!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(color: borderColor!, width: borderWidth!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(
            width: borderWidth!,
            color: themeColor.withAlpha(90),
          ),
        ),
      ),
    );
  }
}
