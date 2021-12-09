import 'package:dg_certification_system/controller/state_control.dart';
import 'package:dg_certification_system/model/menu_tap_model.dart';
import 'package:dg_certification_system/view/screens/certificates_theme_list.dart';
import 'package:dg_certification_system/view/screens/courses_screen.dart';
import 'package:dg_certification_system/view/screens/dashboard_screen.dart';
import 'package:dg_certification_system/view/screens/open_courses_screen.dart';
import 'package:dg_certification_system/view/screens/settings_screen.dart';
import 'package:dg_certification_system/view/screens/trainers_screen.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends StateControl {
  BuildContext context;
  int index;
  List<Widget> screen =  [
    DashboardScreen(),
    const OpenCourserScreen(),
    const CertificatesThemesList(),
    // const SettingsScreen(),
  ];
  List<MenuTapModel>? taps;

  HomeController({required this.context, required this.index}) {
    init();
  }

  @override
  void init() {
    // TODO: implement init
    taps = [
      MenuTapModel(
        icon: 'home',
        id: 0,
        title: 'الرئيسية',
        small: false,
        clicked: index == 0,
      ),
      MenuTapModel(
        icon: 'OpenCourserScreen',
        title: 'الدورات المتاحة',
        id: 1,
        small: false,
        clicked: index == 1,
      ),

      MenuTapModel(
        icon: 'owners',
        title: 'الشهادات',
        id: 2,
        small: false,
        clicked: index == 2,
      ),

      // MenuTapModel(
      //   icon: 'technician',
      //   title: 'الإعدادات',
      //   id: 4,
      //   small: false,
      //   clicked: index == 4,
      // ),
    ];
    super.init();
  }
}
