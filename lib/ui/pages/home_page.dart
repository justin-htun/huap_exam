import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huap_exam/blocs/category_bloc/category_bloc.dart';
import 'package:huap_exam/configs/app_config.dart';
import 'package:huap_exam/ui/widgets/category_list_widget.dart';
import 'package:huap_exam/ui/widgets/drawer_widget.dart';
import 'package:huap_exam/ui/widgets/error_widget.dart';
import 'package:huap_exam/ui/widgets/home_page_loading_widget.dart';

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
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          title: Text('home'.tr()),
          centerTitle: true,
        ),
        body: buildBody(),
        drawer: buildDrawer(context),
      ),
    );
  }

  Widget buildBody() {
    return BlocProvider(
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
              return buildHomePageLoadingWidget();
            } else if (state is CategoryLoading) {
              return buildHomePageLoadingWidget();
            } else if (state is CategoryLoaded) {
              return buildCategoryList(context, state.categoryList);
            } else if (state is CategoryError) {
              return buildErrorWidget(retryAction: () {
                _categoryBloc.add(GetCategoryList());
              });
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
            child: Column(
              children: [
                Text(
                  'quit'.tr(),
                  style: TextStyle(fontSize: xLargeFontSize),
                ),
                const Divider()
              ],
            )),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('tap_to_close'.tr()),
          ],
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('cancel'.tr()),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('ok'.tr()),
          ),
        ],
      ),
    ) ??
        false; //if showDialouge had returned null, then return false
  }
}
