import 'package:dg_certification_system/model/themes.dart';
import 'package:dg_certification_system/repositories/theme_repository.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/screens/theme_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CertificateThemeWidget extends StatefulWidget {
  Themes themes;

  CertificateThemeWidget({Key? key, required this.themes}) : super(key: key);

  @override
  State<CertificateThemeWidget> createState() => _CertificateThemeWidgetState();
}

class _CertificateThemeWidgetState extends State<CertificateThemeWidget> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: ScrollController(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ThemeScreen(
                  themeData: widget.themes.themes[index],
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.white,
              child: Image.network(
                widget.themes.themes[index].backImge,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      itemCount: widget.themes.themes.length,
    );
  }
}
