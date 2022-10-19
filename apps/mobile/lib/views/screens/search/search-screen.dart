import 'package:flutter/material.dart';
import 'package:mobile/views/screens/search/widgets/books-search-bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void _onSearchSubmitted(String text) {
    if (text.isNotEmpty) return;

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 60.0, bottom: 80.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BooksSearchBar(onSearchSubmitted: _onSearchSubmitted),
          ],
        ),
      ),
    );
  }
}
