import 'package:dg_certification_system/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SingleNotificationCard extends StatelessWidget {
  const SingleNotificationCard({
    Key? key,
    required this.title,
    required this.notificationDate,
  }) : super(key: key);

  final String title, notificationDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding/2),
      decoration: const BoxDecoration(
        color: Color(0xffF3F5F8),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child:SvgPicture.asset(
        'assets/svg/notification.svg',
        height: 30,
        width: 30,
      ),

    ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    title,
                    maxLines: 1,


                  ),

                ],
              ),
            ),
          ),
          SelectableText(notificationDate)
        ],
      ),
    );
  }
}
