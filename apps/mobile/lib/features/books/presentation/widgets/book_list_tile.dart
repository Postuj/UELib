import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookListTile extends StatelessWidget {
  const BookListTile({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          'Returened at 14/10/2022',
          style: GoogleFonts.roboto(
            color: const Color(0xff1E1E1E),
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        ),
        leading: const Icon(
          Icons.book_outlined,
          size: 36.0,
        ),
      ),
    );
  }
}
