import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/books/presentation/widgets/returned_book_list_tile.dart';

import '../blocs/borrowing_history/borrowing_history_bloc.dart';

class BorrowHistorySection extends StatelessWidget {
  const BorrowHistorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Borrowing history',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          BlocBuilder<BorrowingHistoryBloc, BorrowingHistoryState>(
            builder: _buildContent,
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, BorrowingHistoryState state) {
    if (state is BorrowingHistoryLoadedState) {
      if (state.books.isNotEmpty) {
        return Flex(
          mainAxisSize: MainAxisSize.min,
          direction: Axis.vertical,
          children: state.books
              .map((book) => ReturnedBookListTile(book: book))
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
            "There aren't any books in Your history",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      );
    } else if (state is BorrowingHistoryLoadingState) {
      return const SizedBox(
        height: 70,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is BorrowingHistoryErrorState) {
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
