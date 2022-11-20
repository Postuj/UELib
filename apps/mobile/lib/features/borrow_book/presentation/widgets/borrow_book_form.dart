import 'package:flutter/material.dart';
import 'package:mobile/core/presentation/router/router.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/borrow_book/presentation/bloc/borrow_book_bloc.dart';
import 'package:mobile/core/presentation/utils/date_time_format_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/or_separator.dart';
import 'book_prop.dart';

class BorrowBookForm extends StatelessWidget {
  final BorrowBookLoadedState state;

  const BorrowBookForm({Key? key, required this.state}) : super(key: key);

  void _onHomeOrCancelClick() {
    final router = getIt<AppRouter>();
    router.pop();
  }

  @override
  Widget build(BuildContext context) {
    final book = state.book;
    final isBorrowed = state is BorrowBookBorrowedState;
    final isLoading = state is BorrowBookBorrowingLoadingState;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isBorrowed ? "Now it's yours!" : "Got it!",
            style: Theme.of(context).textTheme.headline2,
          ),
          Card(
            margin:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
            clipBehavior: Clip.hardEdge,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BookProp(
                    label: 'Title',
                    value: book.title,
                  ),
                  const Divider(
                    color: Color(0xffEADEDE),
                  ),
                  BookProp(
                    label: 'Author',
                    value: '${book.author.name} ${book.author.surname}',
                  ),
                  const Divider(
                    color: Color(0xffEADEDE),
                  ),
                  BookProp(
                    label: 'Published At',
                    value: book.publishedAt.toFormattedDateString(),
                  ),
                  const Divider(
                    color: Color(0xffEADEDE),
                  ),
                  BookProp(
                    label: 'Available',
                    value: book.isAvailable ? 'Yes' : 'No',
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            crossFadeState: isLoading
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
            firstChild: Column(
              children: [
                if (!isBorrowed && book.isAvailable)
                  ElevatedButton(
                    onPressed: () => context
                        .read<BorrowBookBloc>()
                        .add(BorrowBookBorrowEvent(
                          bookId: book.id,
                          plannedDateOfReturn: DateTime.now().add(
                            const Duration(days: 14),
                          ),
                        )),
                    child: Text(
                      'Borrow',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                if (!isBorrowed && book.isAvailable) const OrSeparator(),
                ElevatedButton(
                  onPressed: _onHomeOrCancelClick,
                  child: Text(
                    isBorrowed ? 'Home' : 'Cancel',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ],
            ),
            secondChild: const SizedBox(
              width: double.infinity,
              height: 50.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
