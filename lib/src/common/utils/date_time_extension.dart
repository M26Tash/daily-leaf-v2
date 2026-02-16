import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format() => DateFormat('MMM dd, HH:mm').format(this);
}
