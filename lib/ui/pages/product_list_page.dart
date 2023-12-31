import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huap_exam/blocs/product_list_bloc/product_list_bloc.dart';
import 'package:huap_exam/ui/widgets/error_widget.dart';
import 'package:huap_exam/ui/widgets/product_list_page_loading_widget.dart';
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
      appBar: AppBar(title: Text(widget.categoryName.toUpperCase()), centerTitle: true,),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocProvider(
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
              return buildProductListPageLoadingWidget();
            } else if (state is ProductListLoading) {
              return buildProductListPageLoadingWidget();
            } else if (state is ProductListLoaded) {
              return buildProductList(context, state.productListModel, widget.categoryName);
            } else if (state is ProductListError) {
              return buildErrorWidget(retryAction: () {
                _productListBloc
                    .add(GetProductListByCategoryEvent(widget.categoryName));
              });
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}