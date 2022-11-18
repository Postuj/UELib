import 'package:flutter/material.dart';
import 'package:mobile/features/books/presentation/widgets/home_books_search_bar.dart';
import 'package:mobile/features/books/presentation/widgets/named_books_section.dart';
import 'package:mobile/features/books/presentation/widgets/scan_book_banner.dart';
import 'package:mobile/features/books/presentation/widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: TopBar(),
            ),
            const SliverPersistentHeader(
              delegate: HomeBooksSearchBar(),
              pinned: true,
            ),
            const SliverToBoxAdapter(
              child: ScanBookBanner(),
            ),
            SliverToBoxAdapter(
              child: NamedBooksSection(title: 'Currently borrowed'),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 25.0),
            ),
            SliverToBoxAdapter(
              child: NamedBooksSection(title: 'History'),
            ),
          ],
        ),
      ),
    );
  }
}
