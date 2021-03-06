import 'package:dg_certification_system/view/screens/certificates_theme_list.dart';
import 'package:dg_certification_system/view/screens/login_screen.dart';
import 'package:dg_certification_system/view/screens/open_courses_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  toWidget(GlobalKey<ScaffoldState> key) {
    switch (this) {
      // case 'DashboardScreen':
      //   return  DashboardScreen(key);
      case 'CertificatesThemesList':
        return CertificatesThemesList();
      case 'FormScreen':
        return Container();
      case 'UsersScreen':
        return Container();
      case 'OpenCourserScreen':
        return OpenCourserScreen();
      //AddUser
      case 'AddUser':
        return Container();
      default:
        return Container();
    }
  }

  toSnakBar(BuildContext context) {
    final snackBar = SnackBar(
        backgroundColor: primaryColor,
        content: Container(
          height: 30,
          color: primaryColor,
          child: Center(
            child: SelectableText(
              this,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
    return ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  toDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.only(top: 30.0),
            actionsPadding: EdgeInsets.zero,
            titlePadding: const EdgeInsets.only(top: 10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            title: Column(
              children: [
                const Center(child: SelectableText("?????? ??????")),
                Container(height: 0.5, color: Colors.grey),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Center(child: SelectableText(this)),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    decoration: const BoxDecoration(
                      color: Color(0xff545151),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0)),
                    ),
                    child: const SelectableText(
                      "??????????",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  _willPop() {}

  expirationSession(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () => _willPop(),
            child: AlertDialog(
              contentPadding: const EdgeInsets.only(top: 30.0),
              actionsPadding: EdgeInsets.zero,
              titlePadding: const EdgeInsets.only(top: 10),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              title: Column(
                children: [
                  const Center(child: SelectableText("?????? ??????")),
                  Container(height: 0.5, color: Colors.grey),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Center(child: SelectableText(this)),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false),
                    child: Container(

                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: const BoxDecoration(
                        color: Color(0xff545151),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: const SelectableText(
                        "?????????? ????????????",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  toWaitDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  margin: const EdgeInsets.only(left: 7, right: 7),
                  child: SelectableText(this)),
            ),
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  back(BuildContext context) {
    Navigator.pop(context);
  }
}
