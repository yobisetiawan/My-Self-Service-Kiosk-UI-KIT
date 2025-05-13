import 'package:intl/intl.dart';

String formatCurrency(double value) {
  return NumberFormat.currency(
    locale: 'id_ID', // Indonesian locale
    symbol: '', // Remove the currency symbol
    decimalDigits: 0, // No decimal places
  ).format(value);
}
