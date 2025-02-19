import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/screens/Home/home_screen.dart';
import 'package:todo/widgets/elevated_btn.dart';
import 'package:todo/widgets/login_btn.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = "forget_password";
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('forget_password2'.tr()),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Image.asset("assets/images/forget_password_pic.png",
                      width: 361.w, height: 361.h),
                ),
                const SizedBox(


                  height: 24.0,
                ),

                /// Email Btn
                LoginBtn(
                  show: false,
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: const Icon(
                    Icons.hide_source,
                    color: Colors.transparent,
                  ),
                  tittle: "email".tr(),
                  textEditingController: TextEditingController(),
                  validator: (v){
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
                ElevatedBtn(
                  onPress: (){
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                  lable: "reset_password".tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
