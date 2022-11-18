import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../bloc/books_search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksSearchBar extends StatefulWidget {
  const BooksSearchBar({Key? key}) : super(key: key);

  @override
  State<BooksSearchBar> createState() => _BooksSearchBarState();
}

class _BooksSearchBarState extends State<BooksSearchBar> {
  void _onSearchInputSubmitted(String? input) {
    if (input == null || input.isEmpty) {
      final router = AutoRouter.of(context);
      router.pop();
    } else if (input.length > 2) {
      context.read<BooksSearchBloc>().add(GetBooksEvent(input));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
      child: Hero(
        tag: "booksSearchInputTag",
        child: Material(
          child: TextField(
            autofocus: true,
            onSubmitted: _onSearchInputSubmitted,
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
