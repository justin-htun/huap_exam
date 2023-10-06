import 'package:dio/dio.dart';
import 'package:huap_exam/resources/dio_service.dart';

class ApiProvider {

  Future<List<String>> fetchCategoryList() async {
    try {
      Response response = await DioService.createDio()
          .get("/products/categories");
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

}