import 'package:devcamp_news_app/constants.dart';
import 'package:intl/intl.dart';

class Utilities {
  static String getFlagEmoji(String code) {
    const int offset = 127397;

    String formatted = code.toUpperCase();
    final int first = formatted.codeUnitAt(0);
    final int second = formatted.codeUnitAt(1);

    return String.fromCharCode(first + offset) + String.fromCharCode(second + offset);
  }

  static String getLanguageSymbol(String lang) {
    return lang.toUpperCase();
  }

  static String displayDate(String storyDate) {
    return DateFormat("E, d MMM yy MM:mm:ss").format(
      DateTime.parse(storyDate),
    );
  }

  static String fetchCountryName(String code) {
    var reversed = countries.map((key, value) => MapEntry(value, key));
    return reversed[code]!;
  }

    static String fetchLanguageName(String code) {
    var reversed = languages.map((key, value) => MapEntry(value, key));
    return reversed[code]!;
  }
}
