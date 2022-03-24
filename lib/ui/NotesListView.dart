import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_futter/cubit/homecubit/home_cubit.dart';
import '../model/Notes.dart';

class NotesListView extends StatelessWidget {
  List<Notes>? notesList;
  Function(Notes)? onDeleteNote;
  Function(Notes)? onTapNote;

  NotesListView({Key? key, this.notesList, this.onDeleteNote, this.onTapNote}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return notesList!.length != null
        ? ListView.separated(
            physics: ClampingScrollPhysics(),
            itemCount: notesList!.length,
            itemBuilder: (BuildContext context, int index) {
              return folderItem(context, notesList![index]);
            },
            separatorBuilder: (context, index) {
              return divider();
            },
          )
        : Container();
  }

  Widget divider() {
    return const Divider(
        height: 4,
        thickness: 0.5,
        color: Colors.grey,
        indent: 58,
        endIndent: 20);
  }

  Widget folderItem(BuildContext context, Notes notes) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async{
          onTapNote?.call(notes);
        },
        onLongPress: ()  {
          onDeleteNote?.call(notes);
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: folderItemChild(notes)),
      ),
    );
  }

  Widget folderItemChild(Notes notes) {
    return Row(
      children: [
        const Icon(Icons.folder_outlined, color: Colors.yellow, size: 24),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            notes.title ?? '',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
         Text(notes.id.toString(),
          style: TextStyle(color: Colors.grey, fontSize: 20),
        ),
      ],
    );
  }
}
