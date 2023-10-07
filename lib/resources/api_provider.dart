import 'package:dio/dio.dart';
import 'package:huap_exam/configs/api_config.dart';
import 'package:huap_exam/models/product_list_model.dart';

class ApiProvider {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      receiveTimeout: 30000, // 30 seconds
      connectTimeout: 30000,
      sendTimeout: 30000));

  Future<List<String>> fetchCategoryList() async {
    try {
      Response response = await _dio.get("/products/categories");
      if (response.statusCode == 200) {
        var data = response.data.cast<String>();
        return data;
      } else {
        throw Exception("API responseCode is not 200");
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<ProductListModel> fetchProductListByCategory({required String categoryName}) async {
    try {
      Response response = await _dio.get("/products/category/$categoryName");
      if (response.statusCode == 200) {
        return ProductListModel.fromJson(response.data);
      } else {
        throw Exception("API responseCode is not 200");
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}