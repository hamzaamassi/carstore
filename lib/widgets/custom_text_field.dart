import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String? text;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType? textInputType;
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final double hintStyleSize;
  final double? textStyleSize;
  final Color colorIcon;
  final bool enabled;
  final String? suffixIcon;
  final bool textExit;
  final FormFieldSetter<String>? onSaved;
  final Function(String keyword)? onTextChanged;
  final FocusNode? focusNode;

  final FormFieldValidator<String>? validator;
  final String? labelText;

  final TextInputAction? textInputAction;

  //final MaterialColor hintColor;

  const CustomTextFormField({
    Key? key,
    this.text,
    this.textExit = true,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.textInputType,
    this.textInputAction,
    this.controller,
    this.hintText,
    this.maxLines = 1,
    this.maxLength = -1,
    this.hintStyleSize = 14,
    this.textStyleSize,
    this.colorIcon = LightThemeColors.primaryColor,
    this.enabled = true,
    this.onSaved,
    this.validator,
    this.labelText,
    this.onTextChanged,
    this.focusNode,
    // this.hintColor =  Colors.orange.shade500,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      onSaved: widget.onSaved,
      textInputAction: widget.textInputAction,
      onChanged: widget.onTextChanged,
      validator: widget.validator,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      keyboardType: widget.textInputType,
      obscureText: widget.obscureText ? _obscureText : false,
      obscuringCharacter: '*',
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: TextStyle(
          fontSize: widget.hintStyleSize.sp,
          color: Colors.grey[400],
        ),
        labelStyle: TextStyle(
          fontSize: MyFonts.body2TextSize,
          color: LightThemeColors.dividerColor,
        ),
        filled: true,
        fillColor:
            widget.enabled ? LightThemeColors.textFieldColor : Colors.grey[100],
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).hintColor.withOpacity(0.3),
                  size: 18.r,
                ),
                onPressed: _toggle,
              )
            : GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(widget.suffixIcon!),
                ),
              ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.h,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white), // Set the bottom border color here
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
