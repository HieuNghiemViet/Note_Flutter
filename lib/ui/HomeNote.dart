import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_futter/constain/CustomTextField.dart';
import 'package:note_futter/constain/String.dart';
import 'package:note_futter/db/NotesDao.dart';
import 'package:note_futter/db/NotesDatabase.dart';
import 'package:note_futter/repository/RepositoryDatabase.dart';
import 'package:note_futter/ui/NotesListView.dart';
import '../model/Notes.dart';
import 'dialog/CreateFolderDialog.dart';
import 'package:path_provider/path_provider.dart';

class HomeNote extends StatefulWidget {
  const HomeNote({Key? key}) : super(key: key);

  @override
  State<HomeNote> createState() => _HomeNoteState();
}

class _HomeNoteState extends State<HomeNote> {
  List<Notes>? _list;


  @override
  void initState() {
    print('initState');
    super.initState();
    getAllNotes();


  }

  void getAllNotes() async {
    print('HieuNV: GetAllNotes}');
    final reload = await RepositoryDatabase().getAllNotes();

    setState(() {
      _list = reload;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            nameTitle(),
            searchView(),
            textIcloud(),
            _list != null
                ? Expanded(
              child: NotesListView(
                  notesList: _list,
                  callback: () {
                    getAllNotes();
                  }),
            )
                : Container(),
            createFolderAndFile(context)
          ],
        ),
      ),
    );
  }

  Widget nameTitle() {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(20, 40, 0, 10),
      child: Text(ContainString.folder,
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold)),
    );
  }

  Widget searchView() {
    return Container(
        margin: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
        child: CustomTextField(prefixIcon: true));
  }

  Widget textIcloud() {
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
      child: Text(ContainString.icloud,
          style: TextStyle(color: Colors.white, fontSize: 30)),
    );
  }

  Widget createFolderAndFile(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () => {
                showDialog(
                    context: (context),
                    builder: (context) =>
                        CreateFolderDialog(
                          nameDialog: ContainString.createNameFolder,
                          cancel: ContainString.cancel,
                          save: ContainString.save,
                          onSave: addNote,
                        ))
              },
              child: Icon(Icons.create_new_folder_outlined,
                  color: Colors.yellowAccent, size: 24)),
          Expanded(child: SizedBox()),
          InkWell(
              onTap: () => {},
              child: Icon(Icons.create_outlined,
                  color: Colors.yellowAccent, size: 24)),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  // void addTest() {
  void addNote(String noteName) {
    print('addNote: ${noteName}');
    var notes = new Notes(title: noteName);
    RepositoryDatabase().insertNoteDatabase(notes);
  }

  Future locaPath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    print("local path $appDocPath");
  }
}
