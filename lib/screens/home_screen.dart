import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:notes_with_getx/controllers/note_controller.dart';
import 'package:notes_with_getx/models/note_model.dart';
import 'package:notes_with_getx/routes/routes.dart';
import 'package:notes_with_getx/widgets/appbar_widget.dart';
import 'package:notes_with_getx/widgets/note_card_widget.dart';
import 'package:notes_with_getx/widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(NoteController());
  final String title = 'Notes With Getx';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithActions(
        context,
        title,
        actions: _actions(context),
      ),
      body: _buildBody(context),
      floatingActionButton: _floatingAB(context),
    );
  }

  List<Widget> _actions(context) {
    return [
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () => Get.toNamed(Routes.setting),
      ),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showSearch(context: context, delegate: SearchBarWidget());
        },
      ),
    ];
  }

  Widget _buildBody(context) {
    return Obx(
      () => controller.notes.isNotEmpty
          ? CupertinoScrollbar(
              child: SafeArea(
                child: ListView.separated(
                  itemCount: controller.notes.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, int) => SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    NoteModel note = controller.notes[index];
                    // return NoteCardWidget(note);
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        horizontalOffset: 48.0,
                        child: FadeInAnimation(
                          child: Ink(
                            child: NoteCardWidget(note: note),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          : Container(
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  "You don't have any Notes",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
    );
  }

  Widget _floatingAB(context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        await Get.toNamed(Routes.add);
      },
    );
  }
}
