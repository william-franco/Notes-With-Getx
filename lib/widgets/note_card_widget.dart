import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:notes_with_getx/controllers/note_controller.dart';
import 'package:notes_with_getx/models/note_model.dart';
import 'package:notes_with_getx/screens/home_screen.dart';
import 'package:notes_with_getx/screens/update_note_screen.dart';

class NoteCardWidget extends GetWidget<NoteController> {
  NoteCardWidget({Key? key, required this.note}) : super(key: key);

  // const NoteCardWidget(this.note);

  final NoteModel note;

  Future<void> _showDialogDelete() async {
    return Get.defaultDialog(
      title: 'Delete item',
      content: SingleChildScrollView(
        child: Center(
          child: Text('Are you sure you want to delete the note?'),
        ),
      ),
      actions: [
        TextButton(
          child: Text('Yes'),
          onPressed: () {
            controller.deleteNote(note);
            Get.offAll(HomeScreen());
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
    return Card(
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    note.title!,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => Get.to(UpdateNoteScreen(note: note)),
                    ),
                    IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.delete),
                      onPressed: () => _showDialogDelete(),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 2,
            ),
            Text(
              note.description!,
              maxLines: 4,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              note.dateTimeEdited!,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
