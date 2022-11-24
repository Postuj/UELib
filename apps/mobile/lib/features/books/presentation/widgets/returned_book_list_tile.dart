import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/features/books/domain/entities/borrowed_book.dart';
import '../../../../core/presentation/utils/date_time_format_extension.dart';

class ReturnedBookListTile extends StatelessWidget {
  const ReturnedBookListTile({Key? key, required this.book}) : super(key: key);

  final BorrowedBook book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
      child: ListTile(
        title: Text(
          book.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          'Returned at ${book.returnedAt!.toFormattedDateString()}',
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
