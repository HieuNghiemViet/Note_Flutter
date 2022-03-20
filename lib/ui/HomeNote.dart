import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_futter/constain/CustomTextField.dart';
import 'package:note_futter/constain/String.dart';
import 'package:note_futter/db/NotesDao.dart';
import 'package:note_futter/db/NotesDatabase.dart';
import 'package:note_futter/ui/NotesListView.dart';
import 'dialog/CreateFolderDialog.dart';

class HomeNote extends StatefulWidget {
  const HomeNote({Key? key}) : super(key: key);

  @override
  _HomeNoteState createState() => _HomeNoteState();
}

class _HomeNoteState extends State<HomeNote> {


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
            Expanded(child: NotesListView()),
            createFolderAndFile()
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

  Widget createFolderAndFile() {
    return SafeArea(
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () => {
                    showDialog(
                        context: context,
                        builder: (context) => CreateFolderDialog(
                            ContainString.createNameFolder,
                            ContainString.cancel,
                            ContainString.save))
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
}
