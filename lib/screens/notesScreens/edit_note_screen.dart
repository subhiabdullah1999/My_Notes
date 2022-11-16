import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({Key? key}) : super(key: key);

  @override
  State<EditNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<EditNoteScreen> {
  File? file;
  var imagefile = ImagePicker();
  Future pickimageFromCamera() async {
    var fileimageCamera = await imagefile.pickImage(source: ImageSource.camera);

    if (fileimageCamera != null) {
      setState(() {
        file = File(fileimageCamera.path);
      });
      Navigator.of(context).pop();
    } else {
      print("++++++++++++++++++++++");
      print("error");
    }
  }

  Future uploadImageFromGallery() async {
    var fileimageCamera =
        await imagefile.pickImage(source: ImageSource.gallery);

    if (fileimageCamera != null) {
      setState(() {
        file = File(fileimageCamera.path);
      });
      Navigator.of(context).pop();
    } else {
      print("++++++++++++++++++++++");
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            " تعديل ملاحظة  ",
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
              child: Image(
                image: AssetImage(
                  "assets/images/editnoteimage.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
            Container(
                padding: EdgeInsets.all(15),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        initialValue: " ملاحظتي ",
                        textDirection: TextDirection.rtl,
                        decoration:
                            InputDecoration(prefixIcon: Icon(Icons.edit)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        initialValue: "1/1/2022",
                        keyboardType: TextInputType.number,
                        textDirection: TextDirection.rtl,
                        decoration:
                            InputDecoration(prefixIcon: Icon(Icons.edit)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(" تعديل الصورة"),
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, bottom: 30),
                                    context: context,
                                    title: "اختر مصدر الصورة",
                                    animType: AnimType.BOTTOMSLIDE,
                                    body: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                pickimageFromCamera();
                                              },
                                              icon: Icon(
                                                Icons.camera_alt,
                                                color: Colors.blue,
                                                size: 50,
                                              ),
                                            ),
                                            Text(
                                              "الكميرا",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 90,
                                        ),
                                        Column(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  uploadImageFromGallery();
                                                },
                                                icon: Icon(
                                                  Icons.photo_album,
                                                  color: Colors.blue,
                                                  size: 50,
                                                )),
                                            Text(
                                              "الاستديو",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    dialogType: DialogType.INFO)
                                  ..show();
                              },
                              child: Container(
                                height: 125,
                                child: file == null
                                    ? Text(
                                        "لايوجد صورة",
                                        style: TextStyle(fontSize: 25),
                                      )
                                    : Image.file(
                                        file!,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(" حفظ التعديلات"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.deepPurple,
                                  padding: EdgeInsets.only(
                                      left: 60, right: 60, top: 8, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                        width: 2, color: Colors.green),
                                  ),
                                  textStyle: TextStyle(fontSize: 20)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
