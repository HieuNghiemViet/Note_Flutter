import 'package:flutter/material.dart';
import 'package:note_futter/model/FolderNotes.dart';
import '../model/Notes.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  _NotesListViewState createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  FolderNotes? _folderNotes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: ClampingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => {print('HieuNV: onClick')},
            onLongPress: () => {print('HieuNV: onLongClick')},
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),child: rowList()),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
            height: 4,
            thickness: 0.5,
            color: Colors.grey,
            indent: 58,
            endIndent: 20);
      },
    );
  }

  Widget rowList() {
    return Row(
      children: const [
        Icon(Icons.folder_outlined, color: Colors.yellow, size: 24),
        SizedBox(width: 14),
        Expanded(
            child: Text('_folderNotes!.nameFolder',
                style: TextStyle(color: Colors.white, fontSize: 20))),
        Text('6', style: TextStyle(color: Colors.grey, fontSize: 20)),
      ],
    );
  }
}
