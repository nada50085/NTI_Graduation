
// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthTextFiled extends StatefulWidget {
  final String? hintText;

  final TextEditingController controller;
  bool? obscureText;

  final TextInputType? keyboardType;

  AuthTextFiled({
    super.key,
    this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
  });
  //////////////////////////////////////////
  @override
  State<AuthTextFiled> createState() => _AuthTextFiledState();
}

class _AuthTextFiledState extends State<AuthTextFiled> {
  @override
  void initState() {
    // debugPrint((widget.controller ?? ' no controller provided') as String?);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        labelText: widget.hintText,
      ),
    );
  }
}