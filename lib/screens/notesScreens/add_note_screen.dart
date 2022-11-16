import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  GlobalKey<FormState> fromKey = new GlobalKey<FormState>();

  File? file;
  var _titlenote, _note;

  ImagePicker imagefile = ImagePicker();

  valid() {
    var formstate = fromKey.currentState;
    if (formstate != null) {
      formstate.validate();
      formstate.save();
      addInformationToFirestore();
    }
  }

  // add information to firestore

  Future<void> addInformationToFirestore() async {
    // Call the user's CollectionReference to add a new user
    CollectionReference users =
        await FirebaseFirestore.instance.collection('notes');
    return users.add({
      'title': _titlenote,
      'note': _note,
      "imageUrl": "null",
    }).then((value) {
      print("+++++++++++++_______++++++++++++");
      print("information Added");
    }).catchError((error) {
      print(" ======================");
      print("Failed to add user: $error");
    });
  }

  Future uploadimageFromCamera() async {
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
    var fileimagegallery =
        await imagefile.pickImage(source: ImageSource.gallery);

    if (fileimagegallery != null) {
      setState(() {
        file = File(fileimagegallery.path);
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
            " اضافة ملاحظة  ",
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
                  "assets/images/addnoteimage.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
            Container(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: fromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        onSaved: (val) {
                          _titlenote = val;
                        },
                        validator: (value) {
                          if (value!.length < 3) {
                            return " لا يمكن ان يكون عنوان الملاحظة اقل من 3 احرف";
                          }
                          if (value.length > 100) {
                            return " لا يمكن ان يكون عنوان الملاحظة اكبر من  100 حرف";
                          }
                        },
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            hintText: "   ادخل عنوان ملاحظتك هنا ",
                            prefixIcon: Icon(Icons.edit)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        onSaved: (val) {
                          _note = val;
                        },
                        validator: (value) {
                          if (value!.length < 3) {
                            return " لا يمكن ان يكون الملاحظة اقل من 3 احرف";
                          }
                          if (value.length > 500) {
                            return " لا يمكن ان يكون الملاحظة اكبر من  500 حرف";
                          }
                        },
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            hintText: "   ادخل ملاحظتك هنا",
                            prefixIcon: Icon(Icons.edit)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                                "اختر صورة توضيحية تساعدك في العثور على ملاحظتك"),
                            ElevatedButton(
                              onPressed: () {
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
                                                uploadimageFromCamera();
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
                              child: Text("اختر صورة"),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(
                                      left: 40, right: 40, top: 5, bottom: 5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side:
                                        BorderSide(width: 2, color: Colors.red),
                                  ),
                                  textStyle: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 100,
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
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                valid();
                              },
                              child: Text(" اضافة الملاحظة"),
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
