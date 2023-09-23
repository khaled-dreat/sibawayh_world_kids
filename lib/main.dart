import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'utils/import/app_import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: AppLangConfig.path,
      supportedLocales: AppLangConfig.supportLocale,
      fallbackLocale: AppLangConfig.arLocale,
      child: MultiProvider(providers: providers, child: const MervatApp())));
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => ControolerRecorder()),
  ChangeNotifierProvider(create: (_) => ControllerSpeechToText())
];
