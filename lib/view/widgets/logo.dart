import 'package:flutter/material.dart';

import '../../responsive.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Image.asset(
            'assets/images/logo.png',
            width: 150,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/name.png',
                width: 150,
              ),
              const SizedBox(width: 20,),
              Image.asset(
                'assets/images/logo.png',
                width: 150,
              )
            ],
          );
  }
}
