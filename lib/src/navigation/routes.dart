import 'package:basic_routes_navigation/src/ui/first_screen.dart';
import 'package:basic_routes_navigation/src/ui/home_screen.dart';
import 'package:basic_routes_navigation/src/ui/second_screen.dart';
import 'package:basic_routes_navigation/src/ui/third_screen.dart';
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
        return _buildRoute(FirstPage.create);
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
