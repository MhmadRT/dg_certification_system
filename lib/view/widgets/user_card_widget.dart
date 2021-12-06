import 'package:dg_certification_system/utils/constants.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 37,
        child: Center(
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children:  [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Container(
                    height: 20,
                    width: 20,
                    color: Color(0xffF3F5F8),
                  ),
                ),
                SizedBox(width: defaultPadding/2),
                Text(
                  "Aws Hakam",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: defaultPadding),
                Icon(Icons.keyboard_arrow_down,color: Colors.white,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
