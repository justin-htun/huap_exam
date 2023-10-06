import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huap_exam/ui/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HUAP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white, size: 23),
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
      ),
      home: const HomePage(),
    );
  }
}