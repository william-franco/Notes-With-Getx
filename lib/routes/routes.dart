import 'package:get/get.dart';

// Routes
import 'package:notes_with_getx/screens/add_note_screen.dart';
import 'package:notes_with_getx/screens/home_screen.dart';
import 'package:notes_with_getx/screens/intro_screen.dart';
import 'package:notes_with_getx/screens/setting_screen.dart';
import 'package:notes_with_getx/screens/splash_screen.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static final animation = Transition.cupertino;

  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String home = '/home';
  static const String setting = '/setting';
  static const String error = '/erro';
  static const String add = '/add';

  static final routes = [
    GetPage(name: splash, page: () => SplashScreen(), transition: animation),
    GetPage(name: intro, page: () => IntroScreen(), transition: animation),
    GetPage(name: home, page: () => HomeScreen(), transition: animation),
    GetPage(name: add, page: () => AddNoteScreen(), transition: animation),
    GetPage(name: setting, page: () => SettingScreen(), transition: animation),
    // GetPage(name: error, page: () => ErrorPage())
  ];
}
