import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:huap_exam/models/category.dart';
import 'package:huap_exam/resources/api_repository.dart';
import 'package:huap_exam/resources/db_provider.dart';
import 'package:meta/meta.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetCategoryList>((event, emit) async {
        try {
          emit(CategoryLoading());
          var categoryList = await apiRepository.fetchCategoryList();
          List<Category> tempDBCategoryList = [];
          for (int i = 0; i < categoryList.length; i++) {
            final category = Category()
              ..id = i+1
              ..name = categoryList[i];
            tempDBCategoryList.add(category);
          }
          emit(CategoryLoaded(await AppDatabase().updateAll(tempDBCategoryList)));
        } catch (e){
          var categoryList =  AppDatabase().getAllCategories();
          if(categoryList.isNotEmpty){
            emit(CategoryLoaded(categoryList));
          } else {
            emit(CategoryError("failed_to_fetch_data".tr()));
          }
        }
    });
  }
}
