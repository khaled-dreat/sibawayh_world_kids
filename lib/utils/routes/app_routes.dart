part of '../import/app_import.dart';

class AppRoutes {
  // * Pages  App
  static Map<String, WidgetBuilder> routes = {
    HomePage.nameRoute: (context) => const HomePage(),
    ErSection.nameRoute: (context) => const ErSection(),
  };

  // * inti Route
  static String? get initRoute => ErSection.nameRoute;

  // * push Name
  static void go(BuildContext context, String nameRoute) =>
      Navigator.pushNamed(context, nameRoute);
  // * push Name Replace
  static void goReplace(BuildContext context, String nameRoute) =>
      Navigator.pushReplacementNamed(context, nameRoute);

  // * push Name
  static void goMaterial(BuildContext context, Widget page) {
    MaterialPageRoute<Widget> route =
        MaterialPageRoute(builder: (context) => page);
    Navigator.push(context, route);
  }
}
