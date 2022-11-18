import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books_search/presentation/widgets/book_list_tile.dart';
import 'package:mobile/features/books_search/presentation/widgets/books_search_bar.dart';

import '../bloc/books_search_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<BooksSearchBloc>(),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 60.0, bottom: 80.0),
          child: BlocBuilder<BooksSearchBloc, BooksSearchState>(
            builder: (context, state) {
              return Column(
                children: [
                  const BooksSearchBar(),
                  Expanded(
                    child: _buildBooksListSection(state),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBooksListSection(BooksSearchState state) {
    if (state is BooksSearchLoadedState) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildFoundBooks(state),
        ),
      );
    } else if (state is BooksSearchLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is BooksSearchErrorState) {
      return Center(
        child: Text(
          state.message,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }
    return const SizedBox();
  }

  List<BookListTile> _buildFoundBooks(BooksSearchState state) {
    if (state is BooksSearchLoadedState) {
      return state.books.map((book) => BookListTile(book: book)).toList();
    }
    return [];
  }
}
