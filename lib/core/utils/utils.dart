import 'package:intl/intl.dart';

class Utils {
  static String formatNum(int num) {
    final formatter = NumberFormat.decimalPattern();
    return formatter.format(num);
  }
}
