import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:huap_exam/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      startLocale: const Locale('th', 'TH'),
      path: 'assets/locales',
      fallbackLocale: const Locale('th', 'TH'),
      supportedLocales: const [Locale('th', 'TH'), Locale('en', 'US')],
      saveLocale: true,
      child: MyApp()));
}
