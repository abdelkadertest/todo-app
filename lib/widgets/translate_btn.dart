import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TranslateBtn extends StatelessWidget {
  const TranslateBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 73.28.w,
      minHeight: 30.76.h,
      initialLabelIndex: context.locale.toString() == "en" ? 0 : 1,
      radiusStyle: true,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.white,
      inactiveFgColor: Theme.of(context).primaryColor,
      totalSwitches: 2,
      icons: [
        FontAwesomeIcons.flagUsa,
        MdiIcons.abjadArabic,
      ],
      iconSize: 30.0,
      activeBgColors: [
        [Theme.of(context).primaryColor, Theme.of(context).primaryColor],
        [Theme.of(context).primaryColor, Theme.of(context).primaryColor]
      ],
      // animate: true,
      // curve: Curves.bounceOut,
      onToggle: (index) {
        if (index == 0) {
          context.setLocale(
            const Locale('en'),
          );
        } else {
          context.setLocale(
            const Locale('ar'),
          );
        }
        // print('switched to: $index');
      },
    );
  }
}
