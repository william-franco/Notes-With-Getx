import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_with_getx/controllers/note_controller.dart';
import 'package:notes_with_getx/widgets/appbar_widget.dart';

class AddNoteScreen extends GetView<NoteController> {
  AddNoteScreen({Key? key}) : super(key: key);

  final String title = 'Add Note';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(color: Colors.black, fontSize: 18),
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
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  maxLines: 10,
                  decoration: InputDecoration(hintText: 'Description'),
                  validator: (value) => value!.trim().isNotEmpty
                      ? null
                      : 'Please give discription to note',
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await controller.addNote();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'Add Note',
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
