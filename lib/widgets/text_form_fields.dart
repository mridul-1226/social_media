import 'package:flutter/material.dart';

class CustomTextFormFields extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType type;
  final IconData icon;

  const CustomTextFormFields(
      {super.key,
      required this.label,
      required this.controller,
      required this.obscureText,
      required this.type,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        obscuringCharacter: '*',
        keyboardType: type,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            label: Text(label),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              gapPadding: 10,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                gapPadding: 10,
                borderSide: const BorderSide(color: Colors.white))),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter email id';
          }
          return null;
        },
      ),
    );
  }
}
