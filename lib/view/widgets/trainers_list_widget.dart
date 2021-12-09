import 'package:dg_certification_system/model/recent_file.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../responsive.dart';

class TrainersListWidget extends StatelessWidget {
  const TrainersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: cardColor,
        border: Border.all(
            width: 0.7, color: const Color(0xff707070).withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.04),
            spreadRadius: 2,
            blurRadius: 50,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const SizedBox(
                    height: 37,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "المدربين",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 3, child: Container()),
                const Expanded(flex: 2, child: SearchField())
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: const [
                    Expanded(
                        flex: 2,
                        child: Text(
                          "الأسم الكامل",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    Expanded(
                        flex: 2,
                        child: Text("ألبريد ألألكتروني",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                    Expanded(
                        flex: 1,
                        child: Text("رقم الهاتف",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: demoRecentFiles.length,
              itemBuilder: (context, index) =>
                  recentFileDataRow(demoRecentFiles[index], context),
            ),
          ],
        ),
      ),
    );
  }
}

Widget recentFileDataRow(RecentFile fileInfo, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor),
              ),
              if (!Responsive.isMobile(context))
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  child: Text("Angelina Jolie"),
                ),
            ],
          ),
        ),
        Expanded(flex: 2, child: Text(fileInfo.date!)),
        Expanded(flex: 1, child: Text(fileInfo.size!)),
      ],
    ),
  );
}
