import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String formatter(DateTime datetime) => DateFormat('yyyy/MM/dd HH:mm').format(datetime);
}
