import 'package:flutter/material.dart';

class CustomTextFormFields extends StatelessWidget{

  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType type;


  const CustomTextFormFields({super.key, required this.label, required this.controller, required this.obscureText, required this.type});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        obscuringCharacter: '*',
        keyboardType: type,
        decoration: InputDecoration(
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
                borderSide: const BorderSide(color: Colors.white)
            )),
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