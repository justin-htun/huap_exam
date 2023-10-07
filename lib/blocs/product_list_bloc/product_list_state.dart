part of 'product_list_bloc.dart';

@immutable
abstract class ProductListState extends Equatable{
  const ProductListState();

  @override
  List<Object?> get props => [];
}

class ProductListInitial extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  final ProductListModel productListModel;
  const ProductListLoaded(this.productListModel);
}

class ProductListError extends ProductListState {
  final String? message;

  const ProductListError(this.message);
}
