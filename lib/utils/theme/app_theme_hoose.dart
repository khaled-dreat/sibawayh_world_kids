part of '../import/app_import.dart';

class AppThemeChoose {
  static String? enFont = GoogleFonts.comicNeue().fontFamily;
  static String? arFont = GoogleFonts.harmattan().fontFamily;
  // * Check Lang
  static String? fontFamily(BuildContext context) =>
      AppLang.currentLang(context) == kEn ? enFont : arFont;

  // * Light
  static ThemeData light(BuildContext context) {
    return ThemeData.light().copyWith(
      textTheme:
          Theme.of(context).textTheme.apply(fontFamily: fontFamily(context)),
    );
  }

  // * Dark
  static ThemeData dark(BuildContext context) {
    return ThemeData.dark().copyWith(
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: fontFamily(context),
          ),
    );
  }
}
