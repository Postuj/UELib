import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/currently_borrowed/currently_borrowed_bloc.dart';
import 'currently_borrowed_book_list_tile.dart';

class BorrowedBooksSection extends StatelessWidget {
  const BorrowedBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Currently borrowed',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          BlocBuilder<CurrentlyBorrowedBloc, CurrentlyBorrowedState>(
            builder: _buildContent,
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, CurrentlyBorrowedState state) {
    if (state is CurrentlyBorrowedLoadedState) {
      if (state.books.isNotEmpty) {
        return Flex(
          mainAxisSize: MainAxisSize.min,
          direction: Axis.vertical,
          children: state.books
              .map((book) => CurrentlyBorrowedBookListTile(book: book))
              .toList(),
        );
      }
      return Container(
        margin: const EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        height: 70,
        child: Center(
          child: Text(
            "Currently You don't have any borrowed books",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      );
    } else if (state is CurrentlyBorrowedLoadingState) {
      return const SizedBox(
        height: 70,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is CurrentlyBorrowedErrorState) {
      return const SizedBox(
        height: 70,
        child: Center(
          child: Text(
            'An error occured',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
