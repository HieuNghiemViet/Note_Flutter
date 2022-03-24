import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_futter/constain/CustomTextField.dart';
import 'package:note_futter/constain/String.dart';
import 'package:note_futter/cubit/homecubit/home_cubit.dart';
import 'package:note_futter/cubit/homecubit/home_state.dart';
import 'package:note_futter/ui/NotesListView.dart';
import '../model/Notes.dart';
import 'dialog/CreateFolderDialog.dart';

class HomeNote extends StatefulWidget {
  const HomeNote({Key? key}) : super(key: key);

  @override
  State<HomeNote> createState() => _HomeNoteState();
}

class _HomeNoteState extends State<HomeNote> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllNotes();
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
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state.listNotes.isNotEmpty
                  ? Expanded(
                      child: NotesListView(
                        notesList:
                            state.isSearch ? state.listFilter : state.listNotes,
                        onDeleteNote: (note) {
                          context.read<HomeCubit>().deleteNote(note);
                        },
                        onTapNote: (note) async {
                          await Navigator.pushNamed(context, '/notes_detail',
                              arguments: note);
                          // not getAllNotes
                          context.read<HomeCubit>().getAllNotes();
                        },
                      ),
                    )
                  : Container();
            },
          ),
          createFolderAndFile(context)
        ],
      ),
    ));
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
          onChanged: (name) =>
              context.read<HomeCubit>().filterSearchNotesResults(name),
        ));
  }

  Widget textIcloud() {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
      child: const Text(ContainString.icloud,
          style: TextStyle(color: Colors.white, fontSize: 30)),
    );
  }

  Widget createFolderAndFile(BuildContext homeContext) {
    return SafeArea(
      child: Row(
        children: [
          const SizedBox(width: 20),
          InkWell(
              onTap: () => {
                    showDialog(
                      context: (homeContext),
                      builder: (context) => CreateFolderDialog(
                        nameDialog: ContainString.createNameFolder,
                        cancel: ContainString.cancel,
                        save: ContainString.save,
                        onSave: (name) {
                          BlocProvider.of<HomeCubit>(homeContext).addNote(name);
                        },
                      ),
                    )
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
}
