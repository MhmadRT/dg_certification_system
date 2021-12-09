import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/certificate_theme_widget.dart';
import 'package:dg_certification_system/view/widgets/header_widget.dart';
import 'package:flutter/material.dart';

import 'drag_and_drop_screen.dart';

class CertificatesThemesList extends StatefulWidget {
  const CertificatesThemesList({Key? key});

  @override
  _CertificatesThemesListState createState() => _CertificatesThemesListState();
}

class _CertificatesThemesListState extends State<CertificatesThemesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderWidget(),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  DragAndDropScreen()));
          },
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                  height: 37,
                  child: Row(
                    children: const [
                      SizedBox(width: defaultPadding),
                      Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.white,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: Text(
                          "اضف سمة جديدة",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        const Expanded(
          child: CertificateThemeWidget(),
        )
      ],
    );
  }
}
