import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format() => DateFormat('MMMM dd, yyyy').format(this);
}
