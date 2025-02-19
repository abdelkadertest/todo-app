import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/images/intro_screen.png",
        width: 361.w,
        height: 361.h,
      ),
    );
  }
}
