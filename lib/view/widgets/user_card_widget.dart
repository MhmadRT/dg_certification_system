import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/screens/login_screen.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false);
      },
      child: Container(
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
                      decoration: BoxDecoration(
                        color: Color(0xffF3F5F8),
                        shape: BoxShape.circle
                      ),
                      margin: EdgeInsets.all(4),
                      child:Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(child: Icon( Icons.person)),
                      ),

                    ),
                  ),
                  SizedBox(width: defaultPadding/2),
                  Text(
                    "",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: defaultPadding),
                  Icon(Icons.logout,color: Colors.white,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
