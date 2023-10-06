import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huap_exam/blocs/category_bloc/category_bloc.dart';
import 'package:huap_exam/ui/widgets/category_list_widget.dart';
import 'package:huap_exam/ui/widgets/error_widget.dart';
import 'package:huap_exam/ui/widgets/loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoryBloc _categoryBloc = CategoryBloc();

  @override
  void initState() {
    _categoryBloc.add(GetCategoryList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (_) => _categoryBloc,
        child: BlocListener<CategoryBloc, CategoryState>(
          listener: (context, state) {
            if (state is CategoryError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryInitial) {
                return buildLoading();
              } else if (state is CategoryLoading) {
                return buildLoading();
              } else if (state is CategoryLoaded) {
                return buildCategoryList(context, state.categoryList);
              } else if (state is CategoryError) {
                return buildErrorWidget();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
