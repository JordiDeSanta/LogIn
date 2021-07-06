import 'package:flutter/material.dart';

bool isNumeric(String s) {
  if (s.isEmpty) return false;

  final n = num.tryParse(s);

  return (n == null) ? false : true;
}

void showAlert(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (c) {
      return AlertDialog(
        title: Text('Incorrect Credentials'),
        content: Text(message),
        actions: [
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            label: Text('Ok'),
            icon: Icon(Icons.check),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                elevation: MaterialStateProperty.all(0.0)),
          ),
        ],
      );
    },
  );
}
