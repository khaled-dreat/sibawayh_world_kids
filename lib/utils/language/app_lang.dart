part of '../import/app_import.dart';

class AppLang {
  ///  [currentLang] return en or ar
  static String currentLang(BuildContext context) {
    return context.locale.languageCode;
  }
}
