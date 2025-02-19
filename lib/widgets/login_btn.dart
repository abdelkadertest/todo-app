import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBtn extends StatelessWidget {
  late String tittle;
  late Widget prefixIcon;
  late Widget? suffixIcon;
  late bool show;
  late Function(bool)? showPassword;
  late TextEditingController textEditingController;
  FormFieldValidator<String> validator;

  LoginBtn({
    super.key,
    required this.tittle,
    required this.prefixIcon,
    this.suffixIcon,
    required this.show,
    this.showPassword,
    required this.textEditingController,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: show,
      obscuringCharacter: '*',
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).focusColor,
          ),
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        labelText: tittle,
        labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).canvasColor,
            ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: Theme.of(context).canvasColor,
        suffixIconColor: Theme.of(context).canvasColor,
        iconColor: Theme.of(context).focusColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: Theme.of(context).focusColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: Theme.of(context).focusColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
