import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Providers/my_provider.dart';

class ThemeBtn extends StatelessWidget {
  const ThemeBtn({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ToggleSwitch(
      minWidth: 73.28.w,
      minHeight: 30.76.h,
      initialLabelIndex: provider.themeMode == ThemeMode.light ? 0 : 1,
      radiusStyle: true,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.white,
      inactiveFgColor: Theme.of(context).primaryColor,
      totalSwitches: 2,
      icons: const [
        FontAwesomeIcons.solidSun,
        FontAwesomeIcons.moon,
      ],
      iconSize: 30.0,
      activeBgColors: [
        [Theme.of(context).primaryColor, Theme.of(context).primaryColor],
        [Theme.of(context).primaryColor, Theme.of(context).primaryColor]
      ],
      // animate: true,
      // curve: Curves.bounceOut,
      onToggle: (index) {
        provider.changeTheme();
        // print('switched to: $index');
      },
    );
  }
}
