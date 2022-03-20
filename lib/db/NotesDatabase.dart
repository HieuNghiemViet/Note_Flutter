import 'dart:async';

import 'package:floor/floor.dart';
import 'package:note_futter/db/NotesDao.dart';
import 'package:note_futter/model/Notes.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'NotesDatabase.g.dart';


@Database(version: 1, entities: [Notes])
abstract class NotesDatabase extends FloorDatabase {
  NotesDao get notesDao;

}