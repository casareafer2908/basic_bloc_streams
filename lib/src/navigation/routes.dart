import 'package:basic_bloc_streams/src/ui/home_screen.dart';
import 'package:basic_bloc_streams/src/ui/random_number_page.dart';
import 'package:basic_bloc_streams/src/ui/second_screen.dart';
import 'package:basic_bloc_streams/src/ui/third_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const homePage = '/';
  static const firstPage = '/firstPage';
  static const secondPage = '/secondPage';
  static const thirdPage = '/thirdPage';

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homePage:
        return _buildRoute(HomePage.create);
      case firstPage:
        return _buildRoute(RandomNumberPage.create);
      case secondPage:
        return _buildRoute(SecondPage.create);
      case thirdPage:
        return _buildRoute(ThirdPage.create);
      default:
        throw Exception('This screen doesn\'t exist');
    }
  }

  static MaterialPageRoute<T> _buildRoute<T>(Function buildFun) =>
      MaterialPageRoute<T>(builder: (context) => buildFun(context));
}
