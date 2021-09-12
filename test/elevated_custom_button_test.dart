import 'package:basic_bloc_streams/src/ui/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('onPressed callback', (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(
          home: CustomElevatedButton(
        child: const Text('tap me'),
        onPressed: () => pressed = true,
        color: Colors.green,
      )),
    );
    final button = find.byType(ElevatedButton);
    expect(button, findsOneWidget);
    expect(find.byType(RaisedButton), findsNothing);
    expect(find.text('tap me'), findsOneWidget);
    await tester.tap(button);
    expect(pressed, true);
  });
}
