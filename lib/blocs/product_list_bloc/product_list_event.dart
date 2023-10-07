part of 'product_list_bloc.dart';

@immutable
abstract class ProductListEvent {}

class GetProductListByCategoryEvent extends ProductListEvent {
  final String categoryName;

  GetProductListByCategoryEvent(this.categoryName);
}
