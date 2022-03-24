import 'package:note_futter/model/Notes.dart';

class HomeState {
  List<Notes> listNotes = [];
  List<Notes> listFilter = [];
  bool isSearch = false;

  HomeState({this.listNotes = const [], this.listFilter = const [], this.isSearch = false});

  void _setListNote(List<Notes> newList) => listNotes = newList;

}