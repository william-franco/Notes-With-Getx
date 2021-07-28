import 'package:flutter/material.dart';
import 'package:get/get.dart';

// appbar that return to the old screen
AppBar appBarWithBack(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => Get.back(),
    ),
    centerTitle: false,
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    ),
  );
}

// appbar with actions
AppBar appBarWithActions(BuildContext context, String title,
    {List<Widget>? actions}) {
  return AppBar(
    elevation: 0,
    actions: actions,
    toolbarHeight: 110,
    centerTitle: false,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: false,
      titlePadding: EdgeInsets.all(19.0),
      title: Text(
        title,
        style: TextStyle(fontSize: 26.0),
      ),
    ),
  );
}
