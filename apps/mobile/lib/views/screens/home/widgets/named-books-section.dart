import 'package:flutter/material.dart';
import 'package:mobile/views/screens/home/widgets/book-list-tile.dart';

class NamedBooksSection extends StatelessWidget {
  NamedBooksSection({Key? key, required this.title}) : super(key: key);

  final String title;
  final books = [
    'Economy in one lesson',
    'Clean Code',
    'Clean Architecture',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ...books.map((book) => BookListTile(title: book))
        ],
      ),
    );
  }
}
