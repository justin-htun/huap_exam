import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:huap_exam/models/product_list_model.dart';
import 'package:huap_exam/resources/api_repository.dart';
import 'package:meta/meta.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetProductListByCategoryEvent>((event, emit) async {
      try {
        emit(ProductListLoading());
        final productList = await _apiRepository.fetchProductListByCategory(categoryName: event.categoryName);
        emit(ProductListLoaded(productList));
      } catch (e){
        emit(const ProductListError("Failed to fetch data. is your device online?"));
      }

    });
  }
}
