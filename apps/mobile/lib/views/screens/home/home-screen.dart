import 'package:flutter/material.dart';
import 'package:mobile/views/screens/home/widgets/home-books-search-bar.dart';
import 'package:mobile/views/screens/home/widgets/named-books-section.dart';
import 'package:mobile/views/screens/home/widgets/recomendations.dart';
import 'package:mobile/views/screens/home/widgets/top-bar.dart';

import '../../styles/page_transitions.dart';
import '../search/search-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FloatingActionButton _buildScanBookButton() => FloatingActionButton.extended(
        onPressed: () => {},
        icon: const Icon(
          Icons.qr_code_scanner_outlined,
          color: Colors.white,
        ),
        label: const Text('Scan book'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildScanBookButton(),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 60.0, bottom: 80.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: TopBar(),
            ),
            const SliverPersistentHeader(
              delegate: HomeBooksSearchBarDelegate(),
              pinned: true,
            ),
            const SliverToBoxAdapter(
              child: Recomendations(),
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
