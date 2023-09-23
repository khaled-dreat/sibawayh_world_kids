part of '../utils/import/app_import.dart';

class MervatApp extends StatelessWidget {
  const MervatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        // * Language
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppThemeChoose.light(context),
        darkTheme: AppThemeChoose.dark(context),
        themeMode: ThemeMode.light,
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.initRoute,
      ),
    );
  }
}
