import 'package:dg_certification_system/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../main.dart';


class AddTraineeWidget extends StatelessWidget {
  const AddTraineeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: cardColor,
          border: Border.all(
              width: 0.7,
              color: const Color(0xff707070).withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.04),
              spreadRadius: 2,
              blurRadius: 50,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 37,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: SelectableText('اضافة متدرب',style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Expanded(
                  child: SelectableText('الاسم الكامل',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: SizedBox(
                      height: 37,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF3F5F8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: defaultPadding),
            Row(
              children: const [
                Expanded(
                  child: SelectableText('البريد الألكتروني',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: SizedBox(
                      height: 37,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF3F5F8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: defaultPadding),
            Row(
              children: const [
                Expanded(
                  child: SelectableText('رقم الهاتف',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: SizedBox(
                      height: 37,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF3F5F8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: defaultPadding),
            const SizedBox(height: 50),
            Container(
              height: 37,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: SelectableText('اضافة متدرب',style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
