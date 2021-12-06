
import 'package:dg_certification_system/view/screens/certificates_theme_list.dart';
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
  toWidget(GlobalKey<ScaffoldState> key){
    switch (this) {
      // case 'DashboardScreen':
      //   return  DashboardScreen(key);
        case 'CertificatesThemesList':
        return  CertificatesThemesList();
      case 'FormScreen':
        return  Container();
      case 'UsersScreen':
        return  Container();
      case 'EmployeeScreen':
        return  Container();
        //AddUser
      case 'AddUser':
        return  Container();
      default:
        return  Container();
    }
  }
  toSnakBar(BuildContext context){

    final snackBar = SnackBar(
      backgroundColor: primaryColor,
        content: Container(height: 30,color: primaryColor,
          child: Center(
            child: Text(
              this,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
    return ScaffoldMessenger.of(context).showSnackBar(snackBar,);
  }
  toDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.only(top: 30.0),
            actionsPadding: EdgeInsets.zero,
            titlePadding:  const EdgeInsets.only(top:10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            title: Column(
              children: [
                const Center(child: Text("حدث خطأ")),
                Container(height:0.5,color:Colors.grey),
              ],
            ),
            content: SizedBox(height: MediaQuery.of(context).size.width*.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Center(child: Text(this)),
                    ),
                  ),
                  InkWell(
                    onTap:()=> Navigator.of(context).pop(),
                    child: Container(width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: const BoxDecoration(
                        color: Color(0xff545151),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: const Text(
                        "إغلاق",
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
}
