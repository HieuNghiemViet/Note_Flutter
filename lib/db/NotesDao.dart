import 'package:floor/floor.dart';
import 'package:note_futter/model/Notes.dart';

@dao
abstract class NotesDao {

  @Query('SELECT * FROM Notes')
  Future<List<Notes>> getAllNotes();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNote(Notes notes);

  @update
  Future<void> updateNotes(Notes notes);

  @Query('SELECT * FROM Notes WHERE id=:id')
  Future<Notes?> findNotesById(int id);

  @Query('DELETE * FROM Notes WHERE id=:id')
  Future<void> deleteNotesById(int id);

}