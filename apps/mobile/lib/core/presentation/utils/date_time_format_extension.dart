import 'package:intl/intl.dart';

extension DateTimeFormatter on DateTime {
  // ignore: unused_element
  String toFormattedDateString() {
    final DateFormat format = DateFormat('dd-MM-yyyy');
    return format.format(this);
  }
}
