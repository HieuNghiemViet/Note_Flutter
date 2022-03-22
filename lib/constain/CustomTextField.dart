import 'package:flutter/material.dart';
import 'package:note_futter/ui/HomeNote.dart';

class CustomTextField extends StatefulWidget {
  bool? prefixIcon;
  String? hintText;
  Function(String)? onChanged;

  CustomTextField(
      {this.prefixIcon, this.hintText = 'Tìm kiếm', this.onChanged});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      style: const TextStyle(color: Colors.white, fontSize: 10),
      cursorColor: Colors.white,
      onChanged: (value) {
        print('HieuNV: $value');
        widget.onChanged?.call(value);
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
          prefixIcon: widget.prefixIcon == true
              ? const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 12,
                )
              : null,
          hintText: widget.hintText),
    );
  }
}
