import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const CustomTextField({
    required this.label,
    this.onChanged,
    this.validator,
    this.controller,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: const EdgeInsets.all(12.0),
        label: Text(widget.label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
