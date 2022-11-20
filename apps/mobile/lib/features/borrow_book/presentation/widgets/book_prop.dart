import 'package:flutter/material.dart';

class BookProp extends StatelessWidget {
  const BookProp({Key? key, required this.label, required this.value})
      : super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            width: 260,
            child: Text(
              value,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
