import 'package:intl/intl.dart';

final numFormatter = NumberFormat.decimalPattern('ar');

class Utilities {
  String formatCurrency(int number) {
    print(numFormatter.format(number));
    return numFormatter.format(number);
  }
}
