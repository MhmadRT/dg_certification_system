import 'package:dg_certification_system/utils/constants.dart';
import 'package:flutter/material.dart';

class CourseCardWidget extends StatelessWidget {
  final String image;

  const CourseCardWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Theme.of(context).accentColor, width: 0.3),
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                )),

          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: SelectableText(
                      'اضف تصنيف',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SelectableText(
                      'اضف دورة',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
