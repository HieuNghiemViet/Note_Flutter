import 'package:flutter/material.dart';
import 'package:note_futter/model/Notes.dart';
import 'package:note_futter/repository/RepositoryDatabase.dart';
import 'package:note_futter/ui/HomeNote.dart';
import 'package:note_futter/ui/NotesDetail.dart';
import 'package:note_futter/ui/NotesListView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await RepositoryDatabase().initNotesDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String title = 'Note';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      // '/notes_home' : (context) => HomeNote(),
      // '/notes_detail' : (context) => NotesDetail()
      // },

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/notes_home":
            return MaterialPageRoute(builder: (context) => HomeNote());
          break;

          case '/notes_detail':
            final args = settings.arguments as Notes;
            return MaterialPageRoute(
                builder: (context) => NotesDetail(notes: args));
          break;

          default:
            return MaterialPageRoute(builder: (context) => Container());
        }
      },
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primaryColor: Colors.white),
      home: HomeNote(),
    );
  }
}
