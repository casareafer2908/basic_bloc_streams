import 'package:flutter/material.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => const RandomNumberPage();

  @override
  _RandomNumberPageState createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _back() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
