import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constain/CustomTextField.dart';

class CreateFolderDialog extends StatelessWidget {
  String? nameDialog;
  String? cancel;
  String? save;
  String? nameTitle;
  Function(String)? onSave;

  CreateFolderDialog(
      {Key? key, this.nameDialog, this.cancel, this.save, this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CupertinoAlertDialog(
        title: Text(
          nameDialog!,
          style: TextStyle(color: Colors.white),
        ),
        content: CustomTextField(hintText: 'Tạo', callBack: onTitleChange
            // callBack: onTitleChange,
            //callBack: (value) => nametitle = value,
            ),
        actions: [
          TextButton(
            onPressed: () => {Navigator.pop(context)},
            child: Text(
              cancel!,
              style: TextStyle(color: Colors.yellow),
            ),
          ),
          TextButton(
              onPressed: () {
                onSave?.call(nameTitle ?? "");
                Navigator.pop(context);
              },
              child: Text(
                save!,
                style: TextStyle(color: Colors.yellow),
              ))
        ],
      ),
    );
  }

  void onTitleChange(String name) {
    print("onTitleChange $name");
    nameTitle = name;
  }
}
