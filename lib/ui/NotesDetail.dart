import 'package:flutter/material.dart';

class NotesDetail extends StatefulWidget {
  const NotesDetail({Key? key}) : super(key: key);

  @override
  _NotesDetailState createState() => _NotesDetailState();
}

class _NotesDetailState extends State<NotesDetail> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.black,
      child: Column(
        children: [
          nameTitle(),
        ],
      ),
    ));
  }

  Widget nameTitle() {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(20, 40, 0, 10),
      child: Text('ContainString.folder',
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold)),
    );
  }
}
