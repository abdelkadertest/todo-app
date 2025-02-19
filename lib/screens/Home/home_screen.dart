import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/screens/Home/create_event.dart';
import 'package:todo/screens/Home/tabs/Home_Tab/home_tab.dart';
import 'package:todo/screens/Home/tabs/love_tap.dart';
import 'package:todo/screens/Home/tabs/map_tap.dart';
import 'package:todo/screens/Home/tabs/profile_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateEvent.routeName);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(
            () {},
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            backgroundColor: Theme.of(context).primaryColor,
            label: 'home'.tr(),
          ),
           BottomNavigationBarItem(
            icon: const Icon(Icons.location_on_outlined),
            label: 'map'.tr(),
          ),
           BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.heart),
            label: 'love'.tr(),
          ),
           BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: 'profile'.tr(),
          ),
        ],
      ),
      body: taps[selectedIndex],
    );
  }

  List<Widget> taps = const [
    HomeTab(),
    MapTap(),
    LoveTap(),
    ProfileTap(),
  ];
}
