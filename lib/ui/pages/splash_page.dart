import 'package:flutter/material.dart';
import 'package:huap_exam/blocs/category_bloc/category_bloc.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final CategoryBloc _categoryBloc = CategoryBloc();

  @override
  void initState() {
    super.initState();
    //await AppDatabase().initialize();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return const HomePage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/huap_logo.webp',
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
