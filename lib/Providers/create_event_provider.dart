import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateEventsProvider extends ChangeNotifier {
  List<String> eventsCategory = [
    "bookClub",
    "sports",
    "holiday",
    "metting",
    "gaming",
    "eating",
    "exhibition",
    "workshop",
    "birth_day",
  ];
  List<String> homeEventsCategory = [
    "All",
    "bookClub",
    "sports",
    "holiday",
    "metting",
    "gaming",
    "eating",
    "exhibition",
    "workshop",
    "birth_day",
  ];
  int selectedCategory = 0;

  String get selectedCategoryName => eventsCategory[selectedCategory];

  void changeCategory(index) {
    selectedCategory = index;
    notifyListeners();
  }

  /// for Selected Date in create event
  DateTime selectedDate = DateTime.now();

  void changeDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  ThemeMode themeMode = ThemeMode.light;

  changeThemeMode(ThemeMode mode) {
    themeMode = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  List<IconData> icons = const [
    FontAwesomeIcons.bookOpen,
    FontAwesomeIcons.bicycle,
    FontAwesomeIcons.piggyBank,
    FontAwesomeIcons.database,
    FontAwesomeIcons.gamepad,
    FontAwesomeIcons.bowlFood,
    FontAwesomeIcons.expand,
    FontAwesomeIcons.upwork,
    FontAwesomeIcons.cakeCandles,
  ];
  List<IconData> homeIcons = const [
    FontAwesomeIcons.locationArrow,
    FontAwesomeIcons.bookOpen,
    FontAwesomeIcons.bicycle,
    FontAwesomeIcons.piggyBank,
    FontAwesomeIcons.database,
    FontAwesomeIcons.gamepad,
    FontAwesomeIcons.bowlFood,
    FontAwesomeIcons.expand,
    FontAwesomeIcons.upwork,
    FontAwesomeIcons.cakeCandles,
  ];
}
