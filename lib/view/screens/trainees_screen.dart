import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/add_trainee.dart';
import 'package:dg_certification_system/view/widgets/header_widget.dart';
import 'package:dg_certification_system/view/widgets/trainees_list_widget.dart';
import 'package:flutter/material.dart';


import '../../responsive.dart';

class TraineesScreen extends StatelessWidget {
  const TraineesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child:TraineesListWidget(),
              ),
              if (!Responsive.isMobile(context))
                const SizedBox(width: defaultPadding),
              // On Mobile means if the screen is less than 850 we dont want to show it
              if (!Responsive.isMobile(context))
                const Expanded(
                  flex: 3,
                  child: AddTraineeWidget(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
