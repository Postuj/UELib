import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../styles/page_transitions.dart';
import '../../search/search-screen.dart';

class HomeBooksSearchBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  const HomeBooksSearchBarDelegate([this.height = 87.0]);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding:
          const EdgeInsets.only(left: 3.0, right: 3.0, top: 5.0, bottom: 15.0),
      child: Hero(
        tag: "booksSearchInputTag",
        child: Material(
          child: TextField(
            readOnly: true,
            onTap: (() => Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const SearchScreen(),
                    transitionsBuilder:
                        CustomPageTransitionsBuilder.fadePageTransition,
                  ),
                )),
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

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
