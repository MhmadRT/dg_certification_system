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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
                image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: defaultPadding/2),
        Row(
          children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(5)
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'اضف تصنيف',
                    style: TextStyle(color: Colors.white),

                  ),
                ),
              ),
            ),),
            const SizedBox(width: defaultPadding),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(5)
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'اضف دورة',
    style: TextStyle(color: Colors.white),

    ),
                ),
              ),
            ),),
          ],
        )
      ],
    );
  }
}
