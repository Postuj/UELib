import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/books/presentation/widgets/borrow_history.dart';
import 'package:mobile/features/books/presentation/widgets/home_books_search_bar.dart';
import 'package:mobile/features/books/presentation/widgets/scan_book_banner.dart';
import 'package:mobile/features/books/presentation/widgets/top_bar.dart';

import '../blocs/borrowing_history/borrowing_history_bloc.dart';
import '../blocs/currently_borrowed/currently_borrowed_bloc.dart';
import '../widgets/borrowed_books_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context
        .read<CurrentlyBorrowedBloc>()
        .add(const GetCurrentlyBorrowedEvent());
    context.read<BorrowingHistoryBloc>().add(const GetBorrowingHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: TopBar(),
            ),
            SliverPersistentHeader(
              delegate: HomeBooksSearchBar(),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: ScanBookBanner(),
            ),
            SliverToBoxAdapter(
              child: BorrowedBooksSection(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 25.0),
            ),
            SliverToBoxAdapter(
              child: BorrowHistorySection(),
            ),
          ],
        ),
      ),
    );
  }
}
