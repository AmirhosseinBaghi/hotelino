import 'package:intl/intl.dart';

String priceFormatter(int price) {
  final formatter = NumberFormat.decimalPattern('fa');
  return formatter.format(price);
}
