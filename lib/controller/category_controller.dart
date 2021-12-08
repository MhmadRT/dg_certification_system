import 'package:dg_certification_system/controller/state_control.dart';
import 'package:dg_certification_system/model/category_model.dart';
import 'package:dg_certification_system/repositories/categories_repository.dart';
import 'package:flutter/cupertino.dart';

class CategoryController extends StateControl {
  Categories? categories;
  BuildContext context;
  bool loading = true;

  CategoryController(this.context) {
    init();
  }

  @override
  void init() async {
    loading = true;
    notifyListeners();
    categories = await CategoriesRepository().getCategories(context);
    loading = false;
    notifyListeners();
    super.init();
  }
}
