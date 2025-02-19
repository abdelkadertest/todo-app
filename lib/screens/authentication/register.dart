import 'package:flutter/material.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/screens/authentication/log_in.dart';
import 'package:todo/widgets/login_btn.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/widgets/elevated_btn.dart';

class Register extends StatefulWidget {
  static const String routeName = "register";

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var rePasswordController = TextEditingController();
  bool _isObscuredPassword = true;
  bool _isObscuredRePassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('register'.tr()),
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

                  /// First Name Btn
                  LoginBtn(
                    show: false,
                    prefixIcon: const Icon(Icons.person_outline),
                    tittle: "name".tr(),
                    textEditingController: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "name_is_required".tr();
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
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
                    height: 16.0,
                  ),

                  /// Password Btn
                  LoginBtn(
                    show: _isObscuredPassword,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscuredPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscuredPassword = !_isObscuredPassword;
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

                  ///Re Password Btn
                  LoginBtn(
                    show: _isObscuredRePassword,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscuredRePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscuredRePassword = !_isObscuredRePassword;
                        });
                      },
                    ),
                    tittle: "re_password".tr(),
                    textEditingController: rePasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please_enter_your_password'.tr();
                      }
                      if (value.length < 6) {
                        return 'rePassword_should_be_at_least_6_characters_long'
                            .tr();
                      }
                      if (passwordController.text != value) {
                        return 'Password_and_RePassword_should_match'.tr();
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedBtn(
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        FirebaseManager.createUser(
                          emailController.text,
                          passwordController.text,
                          nameController.text,
                          () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              LogIn.routeName,
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
                                  "the_account_already_exists_for_tha_email."
                                      .tr(),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("ok".tr()),
                                  ),
                                ],
                              ),
                            );
                          },
                          () {
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                backgroundColor: Colors.transparent,
                                title: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                          },
                        );
                        nameController.clear();
                        emailController.clear();
                        passwordController.clear();
                        rePasswordController.clear();
                      }
                    },
                    lable: "create_account".tr(),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LogIn.routeName);
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "already_have_account".tr(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const TextSpan(text: " "),
                            TextSpan(
                              text: "login".tr(),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
