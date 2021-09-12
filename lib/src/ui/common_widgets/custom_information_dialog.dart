import 'package:flutter/material.dart';

class InformationDialog extends StatelessWidget {
  const InformationDialog({
    Key? key,
    required this.title,
    required this.contentText,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  final String title;
  final String contentText;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(
        contentText,
        textAlign: TextAlign.justify,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed,
          child: Text(buttonText),
        )
      ],
    );
  }
}
