import 'package:hive_flutter/hive_flutter.dart';
import 'package:huap_exam/models/category.dart';

class AppDatabase {
  static const category_list_box = "CATEGORY_LIST_BOX";

  Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CategoryAdapter());
    await Hive.openBox<Category>(category_list_box);
  }

  Future<List<Category>> updateAll(List<Category> categoryList) async {
    await Hive.box<Category>(category_list_box).clear();
    await Hive.box<Category>(category_list_box).addAll(categoryList);
    return Hive.box<Category>(category_list_box).values.toList();
  }

  List<Category> getAllCategories() {
    return Hive.box<Category>(category_list_box).values.toList();
  }
}