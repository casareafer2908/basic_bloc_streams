import 'package:flutter/material.dart';
import 'package:basic_routes_navigation/src/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => SecondPage();

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          key: const ValueKey('back'),
          icon: const Icon(Icons.arrow_back),
          onPressed: _back,
        ),
        title: const Text(LocaleKeys.secondPage).tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              LocaleKeys.timesPushedButton,
            ).tr(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: LocaleKeys.incrementTooltip.tr(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
