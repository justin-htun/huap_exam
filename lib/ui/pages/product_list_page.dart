import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huap_exam/blocs/product_list_bloc/product_list_bloc.dart';
import 'package:huap_exam/configs/app_config.dart';
import 'package:huap_exam/ui/widgets/error_widget.dart';
import 'package:huap_exam/ui/widgets/loading_widget.dart';
import 'package:huap_exam/ui/widgets/product_list_widget.dart';

class ProductListPage extends StatefulWidget {
  String categoryName;
  ProductListPage(this.categoryName, {Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final ProductListBloc _productListBloc = ProductListBloc();

  @override
  void initState() {
    _productListBloc.add(GetProductListByCategoryEvent(widget.categoryName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSpaceGreyLightColor,
      appBar: AppBar(title: Text(widget.categoryName.toUpperCase()), centerTitle: true,),
      body: _buildListProduct(),
    );
  }

  Widget _buildListProduct() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _productListBloc,
        child: BlocListener<ProductListBloc, ProductListState>(
          listener: (context, state) {
            if (state is ProductListError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<ProductListBloc, ProductListState>(
            builder: (context, state) {
              if (state is ProductListInitial) {
                return buildLoading();
              } else if (state is ProductListLoading) {
                return buildLoading();
              } else if (state is ProductListLoaded) {
                return buildProductList(context, state.productListModel);
              } else if (state is ProductListError) {
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