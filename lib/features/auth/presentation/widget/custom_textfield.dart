// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
     })
      : super(key: key);

  /// hint text
  final String hintText;

  /// validator call back

  /// TextEditing controller for [TextFormField]
  TextEditingController controller = TextEditingController();


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:widget.controller ,
      validator: (value) {
        if (value!.isEmpty) {
          return "please enter your ${widget.hintText}";
        }
        return null;
      },

      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      textInputAction: TextInputAction.next,
      //todo: add theme file and color
      cursorColor: const Color.fromARGB(31, 74, 68, 68),
      cursorHeight: 20,
      cursorWidth: 2,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: const Color.fromARGB(31, 74, 68, 68),
        hintText: widget.hintText,
      ),
    );
  }
}
