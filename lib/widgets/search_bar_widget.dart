import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:notes_with_getx/controllers/note_controller.dart';
import 'package:notes_with_getx/models/note_model.dart';
import 'package:notes_with_getx/widgets/note_card_widget.dart';

class SearchBarWidget extends SearchDelegate {
  final NoteController controller = Get.find();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.close,
        ),
        onPressed: () => query = "",
      ),
    ];
  }

  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => Get.back(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? controller.notes
        : controller.notes.where(
            (p) {
              return p.title!.toLowerCase().contains(query.toLowerCase()) ||
                  p.description!.toLowerCase().contains(query.toLowerCase());
            },
          ).toList();

    return suggestionList.length > 0
        ? SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: suggestionList.length,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  NoteModel note = suggestionList[index];
                  return NoteCardWidget(note: note);
                },
              ),
            ),
          )
        : Container(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                "No Results Found!",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
  }
}
