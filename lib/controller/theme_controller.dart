import 'package:dg_certification_system/controller/state_control.dart';
import 'package:dg_certification_system/model/themes.dart';
import 'package:dg_certification_system/repositories/theme_repository.dart';
import 'package:flutter/cupertino.dart';

class ThemeController extends StateControl {
  BuildContext context;
  Themes? themes;
  bool loading;
  Themes? themesById;
  bool themePageLoading;

  ThemeController(
      {required this.context,
      this.loading = true,
      this.themePageLoading = true}) {
    getData();
  }

  getData() async {
    themes = await ThemeRepository().getThemes(context);
    loading = false;
    notifyListeners();
  }

  getThemeData(int id) async {
    themesById = await ThemeRepository().getThemeById(context, id);
    themePageLoading = false;
    notifyListeners();
  }
}
