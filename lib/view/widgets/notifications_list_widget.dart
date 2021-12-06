import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/single_notification_card.dart';
import 'package:flutter/material.dart';


class NotificationsListWidget extends StatelessWidget {
  const NotificationsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "التنبيهات",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: defaultPadding),
            //Chart(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
              return const SingleNotificationCard(
                title: "طلب اجازة",
                notificationDate: "05-2-2021",
              );}
            ),
          ],
        ),
      ),
    );
  }
}
