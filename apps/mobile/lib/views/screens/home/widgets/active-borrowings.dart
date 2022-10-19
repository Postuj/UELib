import 'package:flutter/material.dart';

class ActiveBorrowings extends StatelessWidget {
  const ActiveBorrowings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Currently borrowed books',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
