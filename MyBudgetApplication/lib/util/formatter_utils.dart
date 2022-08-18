import 'package:intl/intl.dart';

/// A utility class for generating formatting placeholders for different types.
class FormatterUtils {
  /// Formats the given [price] double value.
  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';

  /// Formats the given [date] object consisting of date and time.
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}