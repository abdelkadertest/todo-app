import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/userProvider.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/screens/authentication/forget_password.dart';
import 'package:todo/screens/authentication/register.dart';
import 'package:todo/screens/Home/home_screen.dart';
import 'package:todo/widgets/elevated_btn.dart';
import 'package:todo/widgets/login_btn.dart';

class LogIn extends StatefulWidget {
  static const String routeName = "logIn";

  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isObscured = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr()),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image.asset("assets/images/logo.png",
                        width: 136.w, height: 186.h),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),

                  /// Email Btn
                  LoginBtn(
                    show: false,
                    prefixIcon: const Icon(Icons.email),
                    tittle: "email".tr(),
                    textEditingController: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please_enter_your_email'.tr();
                      }
                      final emailRegex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'please_enter_a_valid_email_address'.tr();
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),

                  /// Password Btn
                  LoginBtn(
                    show: _isObscured,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    ),
                    tittle: "password".tr(),
                    textEditingController: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please_enter_your_password'.tr();
                      }
                      if (value.length < 6) {
                        return 'password_should_be_at_least_6_characters_long'
                            .tr();
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgetPassword.routeName);
                    },
                    child: Text(
                      textAlign: TextAlign.end,
                      "forget_password".tr(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  ElevatedBtn(
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        FirebaseManager.loginUser(
                          emailController.text,
                          passwordController.text,
                          () async {
                            await userProvider.intUser();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeScreen.routeName,
                              (_) => false,
                            );
                          },
                          (message) {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  'something_went_wrong'.tr(),
                                ),
                                content: Text(
                                  message,
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "ok".tr(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          () {
                            showDialog(
                              context: context,
                              builder: (_) => const AlertDialog(
                                backgroundColor: Colors.transparent,
                                title: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    lable: "login".tr(),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Register.routeName);
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "don_not_have_account".tr(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const TextSpan(text: " "),
                            TextSpan(
                              text: "create_account".tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          indent: 25,
                          endIndent: 15,
                          thickness: 2.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        "or".tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Expanded(
                        child: Divider(
                          indent: 15,
                          endIndent: 25,
                          thickness: 2.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).cardColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0,
                            )),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Register.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              "log_in_with_google".tr(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
