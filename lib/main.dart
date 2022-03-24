import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_futter/cubit/detailcubit/detail_cubit.dart';
import 'package:note_futter/cubit/homecubit/home_cubit.dart';
import 'package:note_futter/cubit/homecubit/home_state.dart';
import 'package:note_futter/model/Notes.dart';
import 'package:note_futter/repository/RepositoryDatabase.dart';
import 'package:note_futter/ui/HomeNote.dart';
import 'package:note_futter/ui/NotesDetail.dart';
import 'package:note_futter/ui/NotesListView.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RepositoryDatabase().initNotesDatabase();

  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  print("local path $appDocPath");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String title = 'Note';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/notes_home":
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => HomeCubit(),
                      child: HomeNote(),
                    ));

          case '/notes_detail':
            final args = settings.arguments as Notes;
            return MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => DetailCubit(),
                      child: NotesDetail(notes: args),
                    ));

          default:
            return MaterialPageRoute(builder: (context) => Container());
        }
      },
      initialRoute: "/notes_home",
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}
