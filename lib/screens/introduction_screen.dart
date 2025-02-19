import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/onBoarding/on_boarding_screen.dart';
import 'package:todo/widgets/elevated_btn.dart';
import 'package:todo/widgets/header_brand.dart';
import 'package:todo/widgets/intro_screen.dart';
import 'package:todo/widgets/theme_btn.dart';
import 'package:todo/widgets/translate_btn.dart';

class IntroductionScreen extends StatelessWidget {
  static const String routeName = "IntroductionScreen";

  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderBrand(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 28,
            ),
            const IntroScreen(),
            Text(
              "Introduction_title".tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              "Introduction_dec".tr(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "language".tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),

                /// Translate Btn
                const SizedBox(
                  child: TranslateBtn(),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "theme".tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(
                  child: ThemeBtn(),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            ElevatedBtn(
              lable: "let’s_start".tr(),
              onPress: () {
                Navigator.pushNamed(context, OnBoardingScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
