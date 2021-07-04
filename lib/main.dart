import 'package:flutter/material.dart';

import 'book_router_delegate.dart';
import 'router_information_parser.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatefulWidget {
  BooksApp({Key? key}) : super(key: key);

  @override
  _BooksAppState createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  BookRouterDelegate _routerDelegate = BookRouterDelegate();
  BookRouteInformationParser _routeInformationParser =
      BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Books app',
        routeInformationParser: _routeInformationParser,
        routerDelegate: _routerDelegate);
  }
}
