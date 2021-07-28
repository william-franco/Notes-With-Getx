import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:notes_with_getx/models/note_model.dart';
import 'package:notes_with_getx/screens/home_screen.dart';
import 'package:notes_with_getx/services/db_service.dart';

class NoteController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final notes = [].obs;

  @override
  void onInit() {
    getNotes();
    super.onInit();
  }

  Future<void> addNote() async {
    await DBService.insert(
      NoteModel(
        description: descriptionController.text,
        title: titleController.text,
        dateTimeEdited: DateFormat("EEE, MMM dd, yyyy hh:mm a").format(
          DateTime.now(),
        ),
        dateTimeCreated: DateFormat("EEE, MMM dd, yyyy hh:mm a").format(
          DateTime.now(),
        ),
      ),
    );
    getNotes();
    Get.back();
  }

  void getNotes() async {
    titleController.text = '';
    descriptionController.text = '';

    List<Map<String, dynamic>> noteList = await DBService.query();
    notes.assignAll(
      noteList.map((data) => new NoteModel.fromJson(data)).toList(),
    );
  }

  void updateNote(id, String? dTCreated) async {
    final title = titleController.text;
    final description = descriptionController.text;
    NoteModel note = NoteModel(
      id: id,
      title: title,
      description: description,
      dateTimeEdited:
          DateFormat("EEE, MMM dd, yyyy hh:mm a").format(DateTime.now()),
      dateTimeCreated: dTCreated,
    );
    await DBService.update(note);
    getNotes();
    Get.offAll(HomeScreen());
  }

  void deleteNote(NoteModel noteModel) async {
    await DBService.delete(noteModel);
    getNotes();
  }

  void deleteAllNotes() async {
    await DBService.deleteAllNotes();
    getNotes();
  }

  // void shareNote(String? title, String? description, String? dateTimeEdited) {
  //   Share.share("$title \n$dateTimeEdited\n\n$description");
  // }
}
