import 'package:dg_certification_system/controller/login_controller.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController? controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = LoginController(context,false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive.isMobile(context)
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 120,
                    ),
                    const SizedBox(height: 30),
                    Container(
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(39),
                          color: cardColor,
                          border: Border.all(
                              width: 0.7,
                              color: const Color(0xff707070).withOpacity(0.4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.04),
                              spreadRadius: 2,
                              blurRadius: 50,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: login(context),
                        )),
                  ],
                ),
              ),
            )
          : Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(39),
                              color: cardColor,
                              border: Border.all(
                                  width: 0.7,
                                  color:
                                      const Color(0xff707070).withOpacity(0.4)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12.withOpacity(0.04),
                                  spreadRadius: 2,
                                  blurRadius: 50,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: login(context),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .3,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: appLang == 'ar'
                                  ? const Radius.circular(0)
                                  : const Radius.circular(70),
                              bottomLeft: appLang == 'ar'
                                  ? const Radius.circular(70)
                                  : const Radius.circular(00))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo_white_text.png',
                            height: 110,
                          ),
                          const SizedBox(
                            height: 20,
                            width: 20,
                          ),
                          Image.asset(
                            'assets/images/logo_white.png',
                            height: 110,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget login(BuildContext context) {
    return Form(
      key: controller!.loginKey,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              "?????????? ????????????",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
            const SizedBox(height: 40),
            TextFormField(
                maxLines: 1,
                controller: controller!.email,
                validator: (v) {
                  if (v!.isEmpty) {
                    return '???? ???????????? ???????????? ????????????????????';
                  } else if (!v.contains('@')) {
                    return '???????????? ???????????????????? ?????? ????????';
                  } else {
                    return null;
                  }
                },
                textDirection: TextDirection.ltr,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                    filled: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    fillColor: const Color(0xffF3F5F8),
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
                    hintText: '???????????? ????????????????????',
                    hintStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold))),
            const SizedBox(height: 10),
            TextFormField(
                controller: controller!.password,
                validator: (v) {
                  if (v!.isEmpty) {
                    return '???? ???????????? ???????? ????????????';
                  } else if (v.length < 6) {
                    return '?????? ???? ?????????? ???? ?? ???????? ???? ????????';
                  } else {
                    return null;
                  }
                },
                maxLines: 1,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) async {
                  controller!.login();
                },
                textDirection: TextDirection.ltr,
                obscureText: true,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).accentColor,
                    ),
                    filled: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    fillColor: const Color(0xffF3F5F8),
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
                    hintText: '???????? ????????????',
                    hintStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold))),
            const SizedBox(height: 40),

              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  controller!.login();
                },
                child: const SelectableText(
                  '?????????? ????????????',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                color: Theme.of(context).primaryColor,
              ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(child: SelectableText('???? ???????? ???????? ???????????? ??')),
            ),
          ],
        ),
      ),
    );
  }
}
