import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:notes_with_getx/controllers/note_controller.dart';
import 'package:notes_with_getx/models/note_model.dart';
import 'package:notes_with_getx/widgets/appbar_widget.dart';

class UpdateNoteScreen extends GetView<NoteController> {
  UpdateNoteScreen({Key? key, this.note}) : super(key: key);

  final String title = 'Update Note';
  final NoteModel? note;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.titleController.text = note!.title!;
    controller.descriptionController.text = note!.description!;
    return Scaffold(
      appBar: appBarWithBack(context, title),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: controller.titleController,
                  showCursor: true,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(hintText: 'Title'),
                  validator: (value) => value!.trim().isNotEmpty
                      ? null
                      : 'Please give title to note',
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controller.descriptionController,
                  style: TextStyle(fontSize: 18),
                  maxLines: 10,
                  decoration: InputDecoration(hintText: 'Description'),
                  validator: (value) => value!.trim().isNotEmpty
                      ? null
                      : 'Please give description to note',
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      controller.updateNote(note!.id, note!.dateTimeCreated);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      'Update Note',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
