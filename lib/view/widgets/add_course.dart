import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';
import 'add_trainee.dart';
import 'xls_upload_widget.dart';

class AddCourse extends StatelessWidget {
  AddCourse({Key? key}) : super(key: key);
  // List<TraineeModel> list = [];
  dynamic newList = {};

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Uint8List? uploadFile = result.files.single.bytes;
      String s = String.fromCharCodes(uploadFile!);
      var string = utf8.decode(uploadFile);
      dynamic csvTable = const CsvToListConverter().convert(string).toList();
      print(csvTable);
      for (var i = 1; i < csvTable.length; ++i) {
        dynamic newText;
        if (csvTable[i].toString().contains(';')) {
          newText = csvTable[i].toString().replaceAll(';', ',').split(',');
        } else {
          newText = csvTable[i];
        }
        print(newText[0]);
        // list.add(TraineeModel(
        //   email: newText[1],
        //   mobile: newText[7],
        //   fullName: newText[2],
        //   nationalId: newText[3],
        //   employeesNationality: 0,
        // ));
      }
      // var json = traineeListJson(list);
      print(json);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        child: SelectableText(
                          "اضافة دورة تدريبية",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 3, child: Container()),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: defaultPadding),
            Row(
              children: const [
                Expanded(
                  flex: 1,
                  child: SelectableText(
                    'اسم الدورة',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
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
                  flex: 1,
                  child: SelectableText(
                    'عدد المتدربين',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
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
                  flex: 1,
                  child: SelectableText(
                    'تاريخ البدء',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
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
                  flex: 1,
                  child: SelectableText(
                    'تاريخ الانتهاء',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
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
            Container(
              padding: const EdgeInsets.all(defaultPadding*2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xffF3F5F8),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // pickFile();
                        xlsUpload(1).pickFile();
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/file_text.svg',
                                height: 50,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Flexible(
                                child: SelectableText(
                                  "اضافة مجموعة من المتدربين عن طريق ملف اكسل",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                actions: [
                                  const AddTraineeWidget(),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Theme.of(context).primaryColor,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Icon(
                                            Icons.clear,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 50,
                              ),
                              Flexible(
                                child: SelectableText(
                                  "اضافة متدرب",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // ignore: avoid_unnecessary_containers
            Center(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {

                  },
                  child: const Center(
                    child: SelectableText(
                      "أضافة",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
