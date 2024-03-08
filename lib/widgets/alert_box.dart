import 'package:flutter/material.dart';

class AlertBox {


  static CustomAlertBox(BuildContext context, String title, String text) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(' OK'),
              ),
            ],
          );
        });
  }
}
