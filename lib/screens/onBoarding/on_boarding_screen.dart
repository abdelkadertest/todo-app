import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todo/screens/authentication/log_in.dart';
import 'package:todo/widgets/header_brand.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = "OnBoardingScreen";

  const OnBoardingScreen({super.key});

  Widget _buildImage(String assetName,
      [double width = 361, double height = 361]) {
    return Image.asset('assets/images/$assetName',
        width: width, height: height);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).hintColor,
    );
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Theme.of(context).cardColor,
      imagePadding: EdgeInsets.zero,
      imageFlex: 1,
    );
    return IntroductionScreen(
      globalBackgroundColor: Theme.of(context).cardColor,
      allowImplicitScrolling: true,
      //Finish Btn
      showDoneButton: true,
      done: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          color: Theme.of(context).cardColor,
        ),
        child: Icon(
          Icons.arrow_forward,
          size: 28,
          color: Theme.of(context).primaryColor,
        ),
      ),
      onDone: () {
        Navigator.pushReplacementNamed(
          context,
          LogIn.routeName,
        );
      },
      //Next Btn
      showNextButton: true,
      next: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          color: Theme.of(context).cardColor,
        ),
        child: Icon(
          Icons.arrow_forward,
          size: 28,
          color: Theme.of(context).primaryColor,
        ),
      ),
      //Back Btn
      showBackButton: true,
      back: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          color: Theme.of(context).cardColor,
        ),
        child: Icon(
          Icons.arrow_back,
          size: 28,
          color: Theme.of(context).primaryColor,
        ),
      ),
      //
      // Dots
      dotsFlex: 3,
      dotsDecorator: DotsDecorator(
        color: Theme.of(context).hintColor,
        activeColor: Theme.of(context).primaryColor,
        activeSize: const Size(24, 8),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(27),
          ),
        ),
      ),
      // Global Header
      globalHeader: const SafeArea(
        child: HeaderBrand(),
      ),
      bodyPadding: const EdgeInsets.only(top: 120),
      // Pages
      pages: [
        // Page1
        PageViewModel(
          title: "onboarding_tittle1".tr(),
          body: "onboarding_text1".tr(),
          image: _buildImage('intro_1.png'),
          decoration: pageDecoration,
        ),
        // Page2
        PageViewModel(
          title: "onboarding_tittle2".tr(),
          body: "onboarding_text2".tr(),
          image: _buildImage('intro_2.png'),
          decoration: pageDecoration,
        ),
        // Page3
        PageViewModel(
          title: "onboarding_tittle3".tr(),
          body: "onboarding_text3".tr(),
          image: _buildImage('intro_3.png'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
