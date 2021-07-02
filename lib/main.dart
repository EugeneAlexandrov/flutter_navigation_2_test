import 'package:flutter/material.dart';
import 'package:flutter_navigation_2_test/pages/book_detail_page.dart';
import 'package:flutter_navigation_2_test/screens/books_list_screen.dart';

import 'models/book.dart';
import 'screens/books_detail_screen.dart';
import 'screens/unknown_screen.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatefulWidget {
  BooksApp({Key? key}) : super(key: key);

  @override
  _BooksAppState createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  Book? _selectedBook;
  bool show404 = false;
  List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('BooksListPage'),
            child: BooksListScreen(books: books, onTapped: _handleBookTapped),
          ),
          if (show404)
            MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
          else if (_selectedBook != null) BookDetailPage(book: _selectedBook!)
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          setState(() {
            _selectedBook = null;
          });
          return true;
        },
      ),
    );
  }

  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }
}
