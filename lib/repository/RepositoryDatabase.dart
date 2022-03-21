import '../db/NotesDao.dart';
import '../db/NotesDatabase.dart';
import '../model/Notes.dart';

class RepositoryDatabase {

  static final RepositoryDatabase _singleton = RepositoryDatabase._internal();
  NotesDao? _notesDao;

  factory RepositoryDatabase() {
    return _singleton;
  }

   RepositoryDatabase._internal();

  Future<void> initNotesDatabase() async {
    final database =
    await $FloorNotesDatabase.databaseBuilder('notes_database.db').build();
    _notesDao = database.notesDao;
  }

  Future<List<Notes>?> getAllNotes() async {
    return _notesDao?.getAllNotes();
  }

  Future<void> insertNoteDatabase(Notes notes) async {
    _notesDao?.insertNote(notes);
  }

  Future<void> deleteNoteDatabase(int id) async {
    _notesDao?.deleteNotesById(id);
  }

  Future<void> updateNoteDatabase(Notes notes) async {
    _notesDao?.updateNotes(notes);
  }

}