import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:huap_exam/resources/api_repository.dart';
import 'package:meta/meta.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetCategoryList>((event, emit) async {
        try {
          emit(CategoryLoading());
          final categoryList = await apiRepository.fetchCategoryList();
          emit(CategoryLoaded(categoryList));
        } catch (e){
          emit(CategoryError("failed_to_fetch_data".tr()));
        }
    });
  }
}
