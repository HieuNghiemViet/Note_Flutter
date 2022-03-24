import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_futter/cubit/homecubit/home_state.dart';
import '../../model/Notes.dart';
import '../../repository/RepositoryDatabase.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  Future getAllNotes() async {
    final list = await RepositoryDatabase().getAllNotes() ?? [];
    print("getAllNotes: ${state.listNotes.length}");
    emit(HomeState(listNotes: list, listFilter: state.listFilter, isSearch: state.isSearch));
  }

  void filterSearchNotesResults(String name) {
    print('HieuNV: name : $name');
    final isSearch = name.isNotEmpty;
    final listFilter = state.listNotes.where((element) => element.title!.toLowerCase().contains(name)).toList();

    emit(HomeState(listNotes: state.listNotes, listFilter: listFilter, isSearch: isSearch));
  }

  Future addNote(String noteName) async {
    print('addNote: $noteName');
    var notes = Notes(title: noteName);
    await RepositoryDatabase().insertNoteDatabase(notes);
    await getAllNotes();
  }

  Future deleteNote(Notes notes) async {
    print("delete notes");
    await RepositoryDatabase().deleteNoteDatabase(notes.id ?? 0);
    await getAllNotes();
  }


}