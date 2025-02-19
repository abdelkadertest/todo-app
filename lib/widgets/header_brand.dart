import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderBrand extends StatelessWidget {
  const HeaderBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/images/header.png",
        width: 159.w,
        height: 50.h,
      ),
    );
  }
}
