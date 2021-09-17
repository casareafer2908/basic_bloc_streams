import 'package:basic_bloc_streams/src/core/blocs/random_number_bloc.dart';
import 'package:basic_bloc_streams/src/core/services/random_number_service.dart';
import 'package:basic_bloc_streams/src/navigation/routes.dart';
import 'package:basic_bloc_streams/src/ui/common_widgets/custom_information_dialog.dart';
import 'package:basic_bloc_streams/src/ui/home_screen.dart';
import 'package:basic_bloc_streams/src/ui/random_number_page.dart';
import 'package:basic_bloc_streams/src/ui/second_screen.dart';
import 'package:basic_bloc_streams/src/ui/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

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

class MockRandomNumberPage extends StatelessWidget {
  const MockRandomNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = RandomNumberService();
    final bloc = RandomNumberBloc(service: service);
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      onGenerateRoute: (settings) => Routes.routes(settings),
      home: RandomNumberPage(
        bloc: bloc,
      ),
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
    testWidgets('Button RandomNumberPage is present in the home screen',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(const MockHomePage());
      //assert
      expect(find.byKey(const ValueKey('randomNumberPage')), findsOneWidget);
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
        'Tap on Button RandomNumberPage triggers navigation to RandomNumberPage and then back button back to home',
        (WidgetTester tester) async {
      //act
      await tester.pumpWidget(Provider<RandomNumberServiceBase>(
        create: (context) => RandomNumberService(),
        child: const MockHomePage(),
      ));
      await tester.tap(find.byKey(const ValueKey('randomNumberPage')));
      await tester.pumpAndSettle();
      //assert
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
      await tester.pumpWidget(const MockRandomNumberPage());
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
