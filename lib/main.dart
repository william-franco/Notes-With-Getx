import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:notes_with_getx/controllers/note_controller.dart';
import 'package:notes_with_getx/controllers/theme_controller.dart';
import 'package:notes_with_getx/routes/routes.dart';
import 'package:notes_with_getx/services/db_service.dart';
import 'package:notes_with_getx/themes/custom_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DBService.initDB();
  Get.lazyPut<ThemeController>(() => ThemeController());
  Get.lazyPut<NoteController>(() => NoteController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromPreferences();
    return GetMaterialApp(
      title: 'Notes With Getx',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: Routes.routes,
      initialRoute: Routes.splash,
    );
  }
}
