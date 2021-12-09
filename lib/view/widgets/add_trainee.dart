import 'package:dg_certification_system/repositories/trainees_repository.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AddTraineeWidget extends StatefulWidget {
  AddTraineeWidget({Key? key, required this.courseId}) : super(key: key);
  final int courseId;

  @override
  State<AddTraineeWidget> createState() => _AddTraineeWidgetState();
}

class _AddTraineeWidgetState extends State<AddTraineeWidget> {
  final TextEditingController _fName = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _nationalId = TextEditingController();

  final TextEditingController _mobile = TextEditingController();

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
                      child: SelectableText(
                        'اضافة متدرب',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SelectableText(
                    'الاسم الكامل',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: SizedBox(
                      height: 37,
                      child: TextField(
                        controller: _fName,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF3F5F8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
              children: [
                Expanded(
                  child: SelectableText(
                    'البريد الألكتروني',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: SizedBox(
                      height: 37,
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF3F5F8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
              children: [
                Expanded(
                  child: SelectableText(
                    'رقم الهاتف',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: SizedBox(
                      height: 37,
                      child: TextField(
                        controller: _mobile,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF3F5F8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
              children: [
                Expanded(
                  child: SelectableText(
                    'الرقم الوطني',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: SizedBox(
                      height: 37,
                      child: TextField(
                        controller: _nationalId,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF3F5F8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
            InkWell(
              onTap: () {

                TraineesRepository().addTrainee(
                    _fName.text.toString(),
                    _mobile.text.toString(),
                    _email.text.toString(),
                    _nationalId.text.toString(),
                    '${widget.courseId}',context).then((value) {
                      setState(() {
                        _fName.text='';
                        _email.text='';
                        _nationalId.text='';
                        _mobile.text='';
                      });
                });
              },
              child: Container(
                height: 37,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      'اضافة متدرب',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
