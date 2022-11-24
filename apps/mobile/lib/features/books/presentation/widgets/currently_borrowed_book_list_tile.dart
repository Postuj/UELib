import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/features/books/domain/entities/borrowed_book.dart';

class CurrentlyBorrowedBookListTile extends StatelessWidget {
  const CurrentlyBorrowedBookListTile({Key? key, required this.book})
      : super(key: key);

  final BorrowedBook book;

  @override
  Widget build(BuildContext context) {
    final int daysLeft =
        book.plannedDateOfReturn.difference(DateTime.now()).inDays;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
      child: ListTile(
        title: Text(
          book.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          'Return in $daysLeft day${daysLeft > 1 ? 's' : ''}',
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
