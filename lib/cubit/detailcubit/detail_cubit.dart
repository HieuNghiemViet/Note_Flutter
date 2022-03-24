import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_futter/cubit/detailcubit/detail_state.dart';

import '../../model/Notes.dart';
import '../../repository/RepositoryDatabase.dart';

class DetailCubit extends Cubit<DetailState> {

  DetailCubit() : super(DetailState());

  Future updateNote(Notes notes) async {
    print("update notes");
    await RepositoryDatabase().updateNoteDatabase(notes);
    emit(DetailState(id: state.id, title: state.title , description: state.description));
  }
}