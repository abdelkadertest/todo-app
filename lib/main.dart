import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/my_provider.dart';
import 'package:todo/Providers/userProvider.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/screens/Home/create_event.dart';
import 'package:todo/screens/Home/tabs/Home_Tab/home_tab.dart';
import 'package:todo/screens/Home/tabs/love_tap.dart';
import 'package:todo/screens/Home/tabs/map_tap.dart';
import 'package:todo/screens/Home/tabs/profile_tap.dart';
import 'package:todo/screens/Home/update_event.dart';
import 'package:todo/screens/authentication/forget_password.dart';
import 'package:todo/screens/authentication/log_in.dart';
import 'package:todo/screens/authentication/register.dart';
import 'package:todo/screens/Home/home_screen.dart';
import 'package:todo/screens/introduction_screen.dart';
import 'package:todo/screens/onBoarding/on_boarding_screen.dart';
import 'package:todo/theme/dark_theme.dart';
import 'package:todo/theme/light_theme.dart';
import 'package:todo/theme/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var authProvider = Provider.of<UserProvider>(context);

    ///object from parent class refer to child
    BaseTheme lightTheme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: lightTheme.themeData,
        darkTheme: darkTheme.themeData,
        themeMode: provider.themeMode,
        initialRoute: authProvider.currentUser != null
            ? HomeScreen.routeName
            : IntroductionScreen.routeName,
        routes: {
          IntroductionScreen.routeName: (context) => const IntroductionScreen(),
          OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
          LogIn.routeName: (context) => const LogIn(),
          Register.routeName: (context) => const Register(),
          ForgetPassword.routeName: (context) => const ForgetPassword(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          HomeTab.routeName: (context) => const HomeTab(),
          MapTap.routeName: (context) => const MapTap(),
          LoveTap.routeName: (context) => const LoveTap(),
          ProfileTap.routeName: (context) => const ProfileTap(),
          CreateEvent.routeName: (context) => CreateEvent(),
          UpdateEvent.routeName: (context) => UpdateEvent(),
          // Add more routes as needed
        },
      ),
    );
  }
}
