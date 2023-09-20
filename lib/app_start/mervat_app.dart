part of '../utils/import/app_import.dart';

class MervatApp extends StatelessWidget {
  const MervatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.initRoute,
      ),
    );
  }
}
