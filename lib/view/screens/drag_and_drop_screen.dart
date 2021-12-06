import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/header_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';
import '../widgets/dragable_widget.dart';
import '../../model/item_model.dart';

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({Key? key}) : super(key: key);

  @override
  _DragAndDropScreenState createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  double height = 100;
  double width = 100;
  TextEditingController content = TextEditingController();
  FontWeight isBold = FontWeight.normal;
  TextAlign textAlign = TextAlign.center;
  List<DragWidget> listWidget = [];

  Color color = Colors.black;

  double textSize = 20;

  double widthContianer = 50;

  double qrSized = 50;

  String image = '';
  List<String> images = [
    'assets/images/certificate2-01.png',
  ];
  List<ItemModel> items = [];

  @override
  Widget build(BuildContext context) {
    height = (MediaQuery.of(context).size.height / 1.5);
    width = (height * 1.41);
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular( 12),
              color: Color(0xffF3F5F8),),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const HeaderWidget(isBack: true,),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Text('تصميم شهادة',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.shade50
                      ),
                      child: Flex(
                        direction:
                        Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          add(),
                          Column(
                            children: [
                              Card(
                                margin: EdgeInsets.all(0),
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Container(
                                      width: width,
                                      height: height,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                          image: DecorationImage(
                                              image: AssetImage('$image'), fit: BoxFit.fill)),
                                      child: Stack(children: listWidget),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          // add()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> finalText = [
    'COURSE_NAME',
    "TRAINEE_NAME",
    "TRAINER_NAME",
    "DATE"
  ];

  add() {
    return Expanded(
        flex: 1,
        child: Container(
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                children: [
                  TextField(
                      onChanged: (v) {
                        setState(() {});
                      },
                      controller: content,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              content.clear();
                            },
                            icon: const Icon(Icons.clear),
                          ),
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          fillColor: Colors.grey.shade200,
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              const BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              const BorderSide(color: Colors.transparent)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              const BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              const BorderSide(color: Colors.transparent)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              const BorderSide(color: Colors.transparent)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              const BorderSide(color: Colors.transparent)),
                          hintText: 'إضافة محتوى',
                          hintStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold))),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      itemCount: finalText.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            content.text += " " + finalText[index] + ' ';
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(finalText[index])),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('سماكة الخظ'),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isBold = FontWeight.bold;
                              });
                              print(isBold.index);
                            },
                            child: Card(
                              color: isBold == FontWeight.bold
                                  ? Colors.black
                                  : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Bold',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isBold == FontWeight.bold
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isBold = FontWeight.normal;
                              });
                              print(isBold.index);
                            },
                            child: Card(
                              color: isBold == FontWeight.normal
                                  ? Colors.black
                                  : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Normal',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isBold == FontWeight.normal
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('المحادات'),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                textAlign = TextAlign.right;
                              });
                            },
                            child: Card(
                              color: textAlign == TextAlign.right
                                  ? Colors.black
                                  : Colors.white,
                              child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.format_align_right,
                                    color: textAlign == TextAlign.right
                                        ? Colors.white
                                        : Colors.black,
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                textAlign = TextAlign.center;
                              });
                            },
                            child: Card(
                              color: textAlign == TextAlign.center
                                  ? Colors.black
                                  : Colors.white,
                              child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.format_align_center,
                                    color: textAlign == TextAlign.center
                                        ? Colors.white
                                        : Colors.black,
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                textAlign = TextAlign.left;
                              });
                            },
                            child: Card(
                              color: textAlign == TextAlign.left
                                  ? Colors.black
                                  : Colors.white,
                              child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.format_align_left,
                                    color: textAlign == TextAlign.left
                                        ? Colors.white
                                        : Colors.black,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('اللون'),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              color = Colors.black;
                              setState(() {});
                            },
                            child: Card(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3000)),
                              child: const SizedBox(
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              color = Colors.black45;
                              setState(() {});
                            },
                            child: Card(
                              color: Colors.black45,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3000)),
                              child: const SizedBox(
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              color = Colors.blue;
                              setState(() {});
                            },
                            child: Card(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3000),
                              ),
                              child: const SizedBox(
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              color = Colors.white;
                              setState(() {});
                            },
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3000),
                              ),
                              child: const SizedBox(
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('حجم الخظ'),
                      const SizedBox(
                        height: 5,
                      ),
                      Slider(
                          value: textSize,
                          min: 10,
                          max: 100,
                          onChanged: (v) {
                            textSize = v;
                            setState(() {});
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('محيط النص'),
                      const SizedBox(
                        height: 5,
                      ),
                      Slider(
                          value: widthContianer,
                          min: 10,
                          max: width,
                          onChanged: (v) {
                            widthContianer = v;
                            setState(() {});
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: widthContianer,
                        color: Colors.black12,
                        child: Text(
                          content.text,
                          textAlign: textAlign,
                          style: TextStyle(
                              fontWeight: isBold,
                              color: color,
                              fontSize: textSize),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      listWidget.add(DragWidget(
                          itemModel: ItemModel(
                              width: widthContianer,
                              height: 0,
                              color: color.value,
                              align: textAlign.index,
                              courseId: 0,
                              fontWight: isBold.index,
                              qrCode: '',
                              text: content.text,
                              textSize: textSize,
                              type: 0,
                              x: 50,
                              y: 50),
                          countInStack: 1,
                          high: height,
                          width: width));
                      print(items);
                      setState(() {});
                    },
                    child: const Text(
                      'إضافة',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('حجم المكون الإضافي'),
                      const SizedBox(
                        height: 5,
                      ),
                      Slider(
                          value: qrSized,
                          min: 10,
                          max: 150,
                          onChanged: (v) {
                            qrSized = v;
                            setState(() {});
                          }),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('مكونات اخرى انقر للإضافة'),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              listWidget.add(
                                DragWidget(
                                  itemModel: ItemModel(
                                      width: qrSized,
                                      height: 0,
                                      color: 0,
                                      align: 0,
                                      courseId: 0,
                                      fontWight: 0,
                                      qrCode: 'qr',
                                      text: '',
                                      textSize: 0,
                                      type: 2,
                                      x: 50,
                                      y: 50),
                                  width: width,
                                  high: height,
                                  countInStack: 2,
                                  // child: Icon(
                                  //   Icons.qr_code_rounded,
                                  //   size: qrSized,
                                  // ),
                                ),
                              );
                              setState(() {});
                            },
                            child: Icon(
                              Icons.qr_code_rounded,
                              size: qrSized,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('اختر الخلفية'),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: (100 / 1.41),
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            image = images[index];
                            setState(() {});
                          },
                          child: Image.network(
                            images[index],
                            width: 100,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          pickFile();
                        },
                        child: const Text('اختر صورة'),
                      ),
                    ],
                  ),
                  if (filesPikerResult != null)
                    Image.memory(
                      filesPikerResult!.files.first.bytes!,
                      height: imageSize,
                    ),
                  if (filesPikerResult != null) const Text('تحديد حجم لصورة'),
                  if (filesPikerResult != null)
                    Slider(
                      value: imageSize,
                      onChanged: (v) {
                        imageSize = v;
                        setState(() {});
                      },
                      max: height,
                      min: 1,
                    ),
                  if (filesPikerResult != null)
                    TextButton(
                      onPressed: () {
                        listWidget.add(
                          DragWidget(
                            itemModel: ItemModel(
                                height: imageSize,
                                width: 0,
                                color: 0,
                                align: 0,
                                courseId: 0,
                                fontWight: 0,
                                qrCode: '',
                                text: filesPikerResult!.files.first.bytes!,
                                textSize: 0,
                                type: 1,
                                x: 50,
                                y: 50),
                            countInStack: listWidget.length + 1,
                            width: width,
                            high: height,
                          ),
                        );
                        setState(() {});
                      },
                      child: const Text('اختر صورة'),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      print("CENTER:${TextAlign.center.index}");
                      print("LEFT:${TextAlign.left.index}");
                      print("RIGHT:${TextAlign.right.index}");
                      print("BLUE:${Colors.blue.value}");
                      print("BOLD:${FontWeight.bold}");
                      print("NORMAL:${FontWeight.normal}");
                      listWidget.clear();
                      items.clear();
                      setState(() {});
                    },
                    child: Text('حذف الكل'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  double imageSize = 30;
  FilePickerResult? filesPikerResult;

  pickFile() async {
    await FilePicker.platform.pickFiles(allowMultiple: false).then((value) {
      setState(() {
        filesPikerResult = value;
      });
    });
  }

  itemWidget(ItemModel itemModel) {
    switch (itemModel.type) {
      case 0:
        return SizedBox(
            width: itemModel.width,
            child: Text(
              itemModel.text,
              textAlign: itemModel.align == 0
                  ? TextAlign.left
                  : itemModel.align == 1
                  ? TextAlign.right
                  : TextAlign.center,
              style: TextStyle(
                fontSize: itemModel.textSize,
                color: Color(itemModel.color),
                fontWeight: itemModel.fontWight == 6
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ));
    }
  }
}
