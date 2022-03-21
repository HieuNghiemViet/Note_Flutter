import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  bool? prefixIcon;
  String? hintText;
  Function(String)? callBack;
  final controller = TextEditingController();

  CustomTextField({this.prefixIcon, this.hintText = 'Tìm kiếm', this.callBack});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      style: const TextStyle(color: Colors.white, fontSize: 10),
      cursorColor: Colors.white,
      onChanged: (value) {
        print("onChanged $value");
        callBack?.call(value);
      },
      decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          isDense: true,
          filled: true,
          fillColor: Colors.grey.withOpacity(0.5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.transparent)),
          prefixIconConstraints:
          const BoxConstraints(minWidth: 24, minHeight: 12),
          prefixIcon: prefixIcon == true ? const Icon(
            Icons.search,
            color: Colors.white,
            size: 12,
          ) : null,
          hintText: hintText),
    );
  }

}