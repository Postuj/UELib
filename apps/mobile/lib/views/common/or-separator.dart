import 'package:flutter/material.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              height: 50.0,
              thickness: 0.7,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'OR',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: Divider(
              height: 50.0,
              thickness: 0.7,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
