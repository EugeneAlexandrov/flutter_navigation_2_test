import 'package:flutter/material.dart';
import 'package:flutter_navigation_2_test/models/book.dart';
import 'package:flutter_navigation_2_test/screens/books_detail_screen.dart';

class BookDetailPage extends Page {
  final Book book;

  BookDetailPage({required this.book}) : super(key: ValueKey(book));

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: Offset(0.0, 1.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: BookDetailsScreen(
            key: ValueKey(book),
            book: book,
          ),
        );
      },
    );
  }
}
