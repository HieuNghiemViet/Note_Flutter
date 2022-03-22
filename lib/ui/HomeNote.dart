import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_futter/constain/CustomTextField.dart';
import 'package:note_futter/constain/String.dart';
import 'package:note_futter/repository/RepositoryDatabase.dart';
import 'package:note_futter/ui/NotesListView.dart';
import '../model/Notes.dart';
import 'dialog/CreateFolderDialog.dart';

class HomeNote extends StatefulWidget {
  const HomeNote({Key? key}) : super(key: key);

  @override
  State<HomeNote> createState() => _HomeNoteState();
}

class _HomeNoteState extends State<HomeNote> {
  List<Notes>? _list;
  List<Notes> listFilter = [];
  String textSearch = "";
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    getAllNotes();

    // getAllNotesvar listNote = [Notes(id: 1, title: "note 1"), Notes(id: 2, title: "note 2"), Notes(id: 3, title: "hungtd")];
    // var array = listNote.map((e) => e.title);
    // var filter = listNote.where((element) => element.title?.contains("note") ?? false);
    // print(array);
    // print(filter);
    // for(final a in filter) {
    //   print("${a.title}");
    // }
  }

  void getAllNotes() async {
    final reload = await RepositoryDatabase().getAllNotes();

    setState(() {
      _list = reload;
    });
  }

  void filterSearchNotesResults(String name) {
    print('HieuNV: name : $name');
    listFilter.clear();
    listFilter = _list!.where((element) => element.title!.toLowerCase().contains(name)).toList();

    setState(() {
      isSearch = name.isNotEmpty;
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
                        notesList: isSearch == true ? listFilter : _list,
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
      margin: const EdgeInsetsDirectional.fromSTEB(20, 40, 0, 10),
      child: const Text(ContainString.folder,
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold)),
    );
  }

  Widget searchView() {
    return Container(
        margin: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
        child: CustomTextField(
          prefixIcon: true,
          onChanged: (value) {filterSearchNotesResults(value);
          },
        ));
  }

  Widget textIcloud() {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
      child: const Text(ContainString.icloud,
          style: TextStyle(color: Colors.white, fontSize: 30)),
    );
  }

  Widget createFolderAndFile(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          const SizedBox(
            width: 20),
          InkWell(
              onTap: () => {
                    showDialog(
                        context: (context),
                        builder: (context) => CreateFolderDialog(
                            nameDialog: ContainString.createNameFolder,
                            cancel: ContainString.cancel,
                            save: ContainString.save,
                            onSave: addNote,
                            callbackReload: () {
                              getAllNotes();
                            }))
                  },
              child: const Icon(Icons.create_new_folder_outlined,
                  color: Colors.yellowAccent, size: 24)),
          const Expanded(child: SizedBox()),
          InkWell(
              onTap: () => {},
              child: const Icon(Icons.create_outlined,
                  color: Colors.yellowAccent, size: 24)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  // void addTest() {
  void addNote(String noteName) {
    print('addNote: $noteName');
    var notes = Notes(title: noteName);
    RepositoryDatabase().insertNoteDatabase(notes);
  }
}
