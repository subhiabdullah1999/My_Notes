import 'package:flutter/material.dart';

class AppAbout extends StatefulWidget {
  const AppAbout({Key? key}) : super(key: key);

  @override
  State<AppAbout> createState() => _AppAboutState();
}

class _AppAboutState extends State<AppAbout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            " حول التطبيق  ",
            style: TextStyle(
                fontSize: 30,
                fontFamily: "Courgette-Regular",
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.5,
              child: Image(
                image: AssetImage(
                  "assets/images/noteslogoimage.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  border: Border.all(color: Colors.black45, width: 2)),
              child: Column(
                children: [
                  Text(
                    "My Notes",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: "Courgette-Regular",
                        fontSize: 35,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "تطبيق خدمي مجاني موجه للمستخدمين لمساعدتهم في تنيظم مذكراتهم",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Text(
                              "  مزايا التطبيق",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                        Text(
                          "  - حفظ المذكرات والملاحظات على الانترنت مع حفظ صورة توضيحية  ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                        ),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Text(
                              "  - حفظ تاريخ المذكرات والملاحظة  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Text(
                              "  - انشاء حساب والدخول بشكل امن للمذكرات  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "  المطور : صبحي عبدالعزيز عبدالله ",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
