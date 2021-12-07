import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/course_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CertificateThemeWidget extends StatelessWidget {
  const CertificateThemeWidget({Key? key}) : super(key: key);

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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.white,
            child: Image.network(
             'https://www.pikpng.com/pngl/b/180-1809582_share-this-article-certificate-transparent-background-clipart-png.png',
              fit: BoxFit.cover,
              color: primaryColor,
            ),
          ),
        ),
      ),
      itemCount: 6,
    );
  }
}
