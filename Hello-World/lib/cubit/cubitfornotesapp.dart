import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/cubit/statesfornoteapp.dart';
import 'package:helloworld/db/sqldatabase.dart';
import 'package:helloworld/model/note.dart';
import 'package:sqflite/sqflite.dart';

class CubitForNoteApp extends Cubit<StatesForNotesApp> {
  CubitForNoteApp() : super(InitialStateForNotesApp());

  /*
        ايه رستم
      */
  Future<List<Note>> fetchingNotesData(
      // {String? category}
      ) async {
    List<Note> allnotes = [];
    final database = await SqliteDatabase.sqlitedatabase();
    try {
      emit(StateReadyForFetchingNotesData());
      final List<Map<String, dynamic>> maps = await database.query("notes");

      for (int i = 0; i < maps.length; i++) {
        // if (category == null) {
        allnotes.add(Note(
            id: maps[i]['id'] as int,
            content: maps[i]['content'] as String,
            category: maps[i]['category'] as String));
        // } else if (maps[i]['category'] as String == category) {
        // allnotes.add(Note(
        //     id: maps[i]['id'] as int,
        //     content: maps[i]['content'] as String,
        //     category: maps[i]['category'] as String));
        // }
      }
      emit(StateFetchingNotesDataSuccessfully(notes: allnotes));
    } catch (errorExp) {
      emit(StateFetchingNotesDataUnsuccessfully(errorExp: errorExp.toString()));
    }
    return allnotes;
  }

  Future<void> insertNote(Note note) async {
    final database = await SqliteDatabase.sqlitedatabase();
    try {
      emit(StateReadyForAddNotesData());
      await database.insert("notes", note.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      emit(StateAddingNotesDataSuccessfully());
    } catch (errorExp) {
      emit(StateAddNoteDataUnsuccessfully(errorExp: errorExp.toString()));
    }
  }

  /*
        لميس سلطاني
      */
  Future<void> addNewNote() async {
    final database = await SqliteDatabase.sqlitedatabase();
    try {
      emit(StateReadyForAddNotesData());
      Note note = Note(
          content: contentController.text, category: categoryController.text);
      await database.insert("notes", note.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      contentController.clear();
      categoryController.clear();
      emit(StateAddingNotesDataSuccessfully());
    } catch (errorExp) {
      emit(StateAddNoteDataUnsuccessfully(errorExp: errorExp.toString()));
    }
  }

  /*
        جنان شباني
      */
  Future<void> deleteNote({required int id}) async {
    final database = await SqliteDatabase.sqlitedatabase();
    try {
      emit(StateReadyForDeleteNotesData());
      await database.delete("notes", where: 'id=?', whereArgs: [id]);
      emit(StateDeletingNotesDataSuccessfully());
    } catch (errorExp) {
      emit(StateDeleteNoteDataUnsuccessfully(errorExp: errorExp.toString()));
    }
  }

  /*
        حيدره ابراهيم
      */
  someNoteData() {
    for (int i = 0; i < 500; i++) {
      if (i % 5 == 0) {
        insertNote(Note(content: "note$i", category: "Studying"));
      } else if (i % 3 == 0) {
        insertNote(Note(content: "note$i", category: "Sport"));
      } else if (i % 2 == 0) {
        insertNote(Note(content: "note$i", category: "Meditation"));
      } else {
        insertNote(Note(content: "note$i", category: "Random"));
      }
    }
  }

  final contentController = TextEditingController();
  final categoryController = TextEditingController();
}
