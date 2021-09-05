import 'package:basic_routes_navigation/src/navigation/routes.dart';
import 'package:basic_routes_navigation/src/ui/random_number_page.dart';
import 'package:basic_routes_navigation/src/ui/home_screen.dart';
import 'package:basic_routes_navigation/src/ui/second_screen.dart';
import 'package:basic_routes_navigation/src/ui/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

//arrange
class MockHomePage extends StatelessWidget {
  const MockHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => Routes.routes(settings),
      home: const HomePage(),
    );
  }
}

class MockFirstPage extends StatelessWidget {
  const MockFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => Routes.routes(settings),
      home: const RandomNumberPage(),
    );
  }
}

class MockSecondPage extends StatelessWidget {
  const MockSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => Routes.routes(settings),
      home: const SecondPage(),
    );
  }
}

class MockThirdPage extends StatelessWidget {
  const MockThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => Routes.routes(settings),
      home: const ThirdPage(),
    );
  }
}

void main() {
  group('HomePageTests', () {
    testWidgets('Button First Page is present in the home screen',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(const MockHomePage());
      //assert
      expect(find.byKey(const ValueKey('firstPage')), findsOneWidget);
    });

    testWidgets('Button Second Page is present in the Home screen',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(const MockHomePage());
      //assert
      expect(find.byKey(const ValueKey('secondPage')), findsOneWidget);
    });

    testWidgets('Button third Page is present in the Home screen',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(const MockHomePage());
      //assert
      expect(find.byKey(const ValueKey('thirdPage')), findsOneWidget);
    });

    testWidgets(
        'Button First Page tap triggers navigation to First Page and back button back to home',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(const MockHomePage());
      await tester.tap(find.byKey(const ValueKey('firstPage')));
      await tester.pumpAndSettle();
      //assert
      expect(find.byType(RandomNumberPage), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('back')));
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets(
        'Button Second Page tap triggers navigation to Second Page and back button back to home',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(const MockHomePage());
      await tester.tap(find.byKey(const ValueKey('secondPage')));
      await tester.pumpAndSettle();
      //assert
      expect(find.byType(SecondPage), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('back')));
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets(
        'Button Second Page tap triggers navigation to Second Page and back button back to home',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(const MockHomePage());
      await tester.tap(find.byKey(const ValueKey('thirdPage')));
      await tester.pumpAndSettle();
      //assert
      expect(find.byType(ThirdPage), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('back')));
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
  group('FirstPage tests', () {
    testWidgets('Button back is present in the first screen',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(const MockFirstPage());
      //assert
      expect(find.byKey(const ValueKey('back')), findsOneWidget);
    });
  });
  group('SecondPage tests', () {
    testWidgets('Button back is present in the Second screen',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(const MockSecondPage());
      //assert
      expect(find.byKey(const ValueKey('back')), findsOneWidget);
    });
  });
  group('ThirdPage tests', () {
    testWidgets('Button back is present in the Third screen',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(const MockThirdPage());
      //assert
      expect(find.byKey(const ValueKey('back')), findsOneWidget);
    });
  });
}
