import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<String>> fetchCategoryList() {
    return _provider.fetchCategoryList();
  }
}