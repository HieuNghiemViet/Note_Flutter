import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_futter/cubit/detailcubit/detail_cubit.dart';
import 'package:note_futter/cubit/homecubit/home_cubit.dart';
import 'package:note_futter/repository/RepositoryDatabase.dart';

import '../model/Notes.dart';

class NotesDetail extends StatefulWidget {
  Notes? notes;

  NotesDetail({Key? key, this.notes}) : super(key: key);

  @override
  _NotesDetailState createState() => _NotesDetailState();
}

class _NotesDetailState extends State<NotesDetail> {
  TextEditingController descriptionController = new TextEditingController();

  @override
  void initState() {
    if (widget.notes?.description != null) {
      descriptionController.text = widget.notes!.description!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Column(
        children: [
          nameTitle(),
          descriptionNotes(),
        ],
      ),
    ));
  }

  Widget nameTitle() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.notes?.title ?? '',
              style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
          InkWell(
              onTap: () {updateNote();},
              child: const Text('Xong',
                  style: TextStyle(color: Colors.yellow, fontSize: 20)))
        ],
      ),
    );
  }

  Widget descriptionNotes() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
      child: TextField(
        controller: descriptionController,
        onChanged: (text) {
          print('HieuNV $text');
        },
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.yellow,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        maxLength: null,
        decoration: const InputDecoration(focusedBorder: InputBorder.none),
      ),
    );
  }

  void updateNote() {
    final notes = Notes(
        id: widget.notes!.id,
        title: widget.notes!.title,
        description: descriptionController.text);
    context.read<DetailCubit>().updateNote(notes);
  }
}
