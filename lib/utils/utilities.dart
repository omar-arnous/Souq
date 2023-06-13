import 'package:intl/intl.dart';

final numFormatter = NumberFormat.decimalPattern('ar');

class Utilities {
  String formatCurrency(int number) {
    return numFormatter.format(number);
  }
}
