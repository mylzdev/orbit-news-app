import 'package:intl/intl.dart' as intl;

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return intl.DateFormat('MMMM dd, yyyy').format(date);
  }

  // Convert string to datetime
  static DateTime formatStringToDateTime(String date) {
    return DateTime.parse(date);
  }
}
