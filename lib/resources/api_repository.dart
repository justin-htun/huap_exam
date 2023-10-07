import 'package:huap_exam/models/product_list_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<String>> fetchCategoryList() {
    return _provider.fetchCategoryList();
  }

  Future<ProductListModel> fetchProductListByCategory({required String categoryName}) {
    return _provider.fetchProductListByCategory(categoryName: categoryName);
  }
}