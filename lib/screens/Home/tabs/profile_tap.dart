import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/userProvider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/screens/authentication/log_in.dart';
import 'package:todo/widgets/theme_btn.dart';
import 'package:todo/widgets/translate_btn.dart';

class ProfileTap extends StatelessWidget {
  static const String routeName = "profile_tap";

  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140.h,
        leading: const SizedBox(),
        leadingWidth: 0,
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "welcome_back".tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "${userProvider.userModel?.name}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "${userProvider.userModel?.email}",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 20,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('language'.tr()),
                      SizedBox(
                        height: 16.h,
                      ),
                      const TranslateBtn(),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text('theme'.tr()),
                      SizedBox(
                        height: 16.h,
                      ),
                      const ThemeBtn(),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity.h,
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseManager.signOutUser().then((_) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, LogIn.routeName, (context) => false);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFF5659),
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "Logout",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
