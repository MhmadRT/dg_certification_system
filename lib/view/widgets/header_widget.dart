import 'dart:html';

import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/search_field_widget.dart';
import 'package:dg_certification_system/view/widgets/user_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final bool isBack;

  const HeaderWidget({Key? key, this.isBack = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (isBack)
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor
                  ),
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.navigate_before,
                    color: Colors.white,
                  ),
                )),
              ),
            Expanded(
              flex: 3,
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(child: SearchField()),
                  const SizedBox(width: defaultPadding),
                  UserCard(),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
