import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constain/CustomTextField.dart';

class CreateFolderDialog extends StatelessWidget {
  String? nameDialog;
  String? cancel;
  String? save;

  CreateFolderDialog(this.nameDialog, this.cancel, this.save, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CupertinoAlertDialog(
        title: Text(nameDialog!, style: TextStyle(color: Colors.white),),
        content: CustomTextField(hintText: 'Tạo'),
        actions: [
          TextButton(
            onPressed: () => {Navigator.pop(context)},
            child: Text(cancel!,
              style: TextStyle(color: Colors.yellow),
            ),
          ),
          TextButton(
              onPressed: () => {},
              child: Text(save!,
                  style:
                  TextStyle(color: Colors.yellow)))
        ],
      ),
    );
  }
}
