// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotesDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorNotesDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$NotesDatabaseBuilder databaseBuilder(String name) =>
      _$NotesDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$NotesDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$NotesDatabaseBuilder(null);
}

class _$NotesDatabaseBuilder {
  _$NotesDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$NotesDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$NotesDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<NotesDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$NotesDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$NotesDatabase extends NotesDatabase {
  _$NotesDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NotesDao? _notesDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Notes` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT, `description` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NotesDao get notesDao {
    return _notesDaoInstance ??= _$NotesDao(database, changeListener);
  }
}

class _$NotesDao extends NotesDao {
  _$NotesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _notesInsertionAdapter = InsertionAdapter(
            database,
            'Notes',
            (Notes item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description
                }),
        _notesUpdateAdapter = UpdateAdapter(
            database,
            'Notes',
            ['id'],
            (Notes item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Notes> _notesInsertionAdapter;

  final UpdateAdapter<Notes> _notesUpdateAdapter;

  @override
  Future<List<Notes>> getAllNotes() async {
    return _queryAdapter.queryList('SELECT * FROM Notes',
        mapper: (Map<String, Object?> row) => Notes(
            id: row['id'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?));
  }

  @override
  Future<Notes?> findNotesById(int id) async {
    return _queryAdapter.query('SELECT * FROM Notes WHERE id=?1',
        mapper: (Map<String, Object?> row) => Notes(
            id: row['id'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> deleteNotesById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Notes WHERE id=?1', arguments: [id]);
  }

  @override
  Future<void> insertNote(Notes notes) async {
    await _notesInsertionAdapter.insert(notes, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateNotes(Notes notes) async {
    await _notesUpdateAdapter.update(notes, OnConflictStrategy.abort);
  }
}
