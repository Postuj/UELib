import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 5.0, right: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hello, Maciej',
            style: Theme.of(context).textTheme.headline3,
          ),
          const Icon(
            Icons.account_circle_outlined,
            size: 35.0,
          )
        ],
      ),
    );
  }
}
