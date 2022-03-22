import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constain/CustomTextField.dart';

class CreateFolderDialog extends StatelessWidget {
  String? nameDialog;
  String? cancel;
  String? save;
  String? nameTitle;
  Function(String)? onSave;
  Function? callbackReload;

  CreateFolderDialog(
      {Key? key,
      this.nameDialog,
      this.cancel,
      this.save,
      this.onSave,
      this.callbackReload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CupertinoAlertDialog(
        title: Text(
          nameDialog!,
          style: const TextStyle(color: Colors.white),
        ),
        content: CustomTextField(
            hintText: 'Tạo',
            onChanged: (name) {nameTitle = name;}),
        actions: [
          TextButton(
            onPressed: () => {Navigator.pop(context)},
            child: Text(
              cancel!,
              style: const TextStyle(color: Colors.yellow),
            ),
          ),
          TextButton(
              onPressed: () {
                onSave?.call(nameTitle!);
                callbackReload?.call();
                Navigator.pop(context);
              },
              child: Text(
                save!,
                style: const TextStyle(color: Colors.yellow),
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
