import 'package:flutter/material.dart';

class BooksSearchBar extends StatelessWidget {
  const BooksSearchBar({Key? key, required this.onSearchSubmitted})
      : super(key: key);
  final void Function(String) onSearchSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
      child: Hero(
        tag: "booksSearchInputTag",
        child: Material(
          child: TextField(
            autofocus: true,
            onSubmitted: onSearchSubmitted,
            style: Theme.of(context).textTheme.bodyText2,
            decoration: const InputDecoration(
              hintText: 'Search for book, author...',
              prefixIcon: Icon(
                Icons.search,
                size: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
