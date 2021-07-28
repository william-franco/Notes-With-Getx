import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:notes_with_getx/controllers/note_controller.dart';
import 'package:notes_with_getx/controllers/theme_controller.dart';
import 'package:notes_with_getx/widgets/appbar_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  final String title = 'Settings';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late ThemeMode _themeMode;

  // final NoteController controller = Get.find();

  Future<void> _showDialogTheme() async {
    _themeMode = ThemeController.to.themeMode;
    return Get.defaultDialog(
      title: 'Select theme',
      content: SingleChildScrollView(
        child: Column(
          children: [
            RadioListTile(
              title: Text('System'),
              value: ThemeMode.system,
              groupValue: _themeMode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _themeMode = value!;
                  ThemeController.to.setThemeMode(_themeMode);
                });
                Get.back();
              },
            ),
            RadioListTile(
              title: Text('Dark'),
              value: ThemeMode.dark,
              groupValue: _themeMode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _themeMode = value!;
                  ThemeController.to.setThemeMode(_themeMode);
                });
                Get.back();
              },
            ),
            RadioListTile(
              title: Text('Light'),
              value: ThemeMode.light,
              groupValue: _themeMode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _themeMode = value!;
                  ThemeController.to.setThemeMode(_themeMode);
                });
                Get.back();
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Close'),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }

  Future<void> _showDialogDelete() async {
    final controller = Get.put(NoteController());
    return Get.defaultDialog(
      title: 'Delete',
      content: SingleChildScrollView(
        child: Center(
          child: Text('Are you sure you want to delete all notes?'),
        ),
      ),
      actions: [
        TextButton(
          child: Text('Yes'),
          onPressed: () {
            controller.deleteAllNotes();
            Get.back();
          },
        ),
        TextButton(
          child: Text('No'),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBack(context, widget.title),
      body: _buildContents(context),
    );
  }

  Widget _buildContents(BuildContext context) {
    return CupertinoScrollbar(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Theme'),
              subtitle: Text('Choose a theme for the app.'),
              onTap: () => _showDialogTheme(),
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              subtitle: Text('This will delete all items.'),
              onTap: () => _showDialogDelete(),
            ),
          ],
        ),
      ),
    );
  }
}
