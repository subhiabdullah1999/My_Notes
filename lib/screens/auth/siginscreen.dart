import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_notes/functions/functions.dart';

import '../notesScreens/notes_home.dart';

class SigInScreen extends StatefulWidget {
  const SigInScreen({Key? key}) : super(key: key);

  @override
  State<SigInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<SigInScreen> {
  TextEditingController _emailController = TextEditingController();
  var _username, _email, _passowrd, _passwordtow;
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  FirebaseFirestore firestoreinstance = FirebaseFirestore.instance;
  bool showPassord = true;
  Icon _icon = Icon(
    Icons.remove_red_eye,
    color: Colors.green,
  );

  Future<void> addUser() async {
    // Call the user's CollectionReference to add a new user
    CollectionReference users =
        await FirebaseFirestore.instance.collection('user');
    return users.add({
      'userName': _username,
      'email': _email,
      "password": _passwordtow,
    }).then((value) {
      print("+++++++++++++_______++++++++++++");
      print("User Added");
    }).catchError((error) {
      print(" ======================");
      print("Failed to add user: $error");
    });
  }

  //end add user

  Future signinfirebase() async {
    var dataForm = formkey.currentState;
    if (dataForm != null) {
      dataForm.save();
      try {
        showDialogLoading(context);
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _passwordtow,
        );

        Navigator.of(context).pop();

        AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            body: Text(
              "تم تسجيل الدخول بنجاح",
              style: TextStyle(color: Colors.purpleAccent, fontSize: 20),
            ))
          ..show();
        Future.delayed(Duration(seconds: 5), () {
          Navigator.of(context).pushReplacementNamed("noteshome");
        });
        if (dataForm.validate()) {
          // addUser();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NotesHome()));
        } else {}
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              dialogType: DialogType.WARNING,
              btnOk: ElevatedButton(onPressed: () {}, child: Text("ok")),
              btnOkColor: Colors.green,
              body: Text(
                "  كلمة المرور ضعيفة الرجاء اختيار كلمة مرور اقوى  ",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ))
            ..show();
          Future.delayed(Duration(seconds: 5), () {
            Navigator.of(context).pop();
          });
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              btnOk: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("ok")),
              btnOkColor: Colors.green,
              body: Text(
                "البريد الالكتروني مسجل مسبقا",
                style: TextStyle(color: Colors.purpleAccent, fontSize: 20),
              ))
            ..show();
          Future.delayed(Duration(seconds: 8), () {
            Navigator.of(context).pop();
          });
        }
      } catch (e) {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            btnOk: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("ok")),
            btnOkColor: Colors.green,
            body: Text(
              "$e",
              style: TextStyle(color: Colors.purpleAccent, fontSize: 20),
            ))
          ..show();
        Future.delayed(Duration(seconds: 5), () {
          Navigator.of(context).pop();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Image(
                image: AssetImage("assets/images/signinimage.png"),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 35, left: 35, right: 35, bottom: 10),
              child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (_value) {
                          _username = _value;
                        },
                        validator: (value) {
                          if (value!.length < 2) {
                            return "اسم المستخدم لا يمكن ان يكون اقل من حرفين";
                          }
                          if (value.length > 20) {
                            return "اسم المستخدم لا يمكن ان يكون اكبر من 20 حرف";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.center,
                        maxLength: 30,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: " اسم المستخدم   ",
                          labelStyle:
                              TextStyle(color: Colors.blueAccent, fontSize: 25),
                          hintText: " ادخل اسم المستخدم هنا ",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onSaved: (_value) {
                          _email = _value;
                        },
                        validator: (value) {
                          if (value!.length < 4) {
                            return " الايميل خاطئ  ";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: " ادخل ايميلك   ",
                          labelStyle:
                              TextStyle(color: Colors.blueAccent, fontSize: 25),
                          hintText: " ادخل ايميلك  هنا ",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          prefixIcon: Icon(Icons.email),
                        ),
                        controller: _emailController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onSaved: (_value) {
                          _passowrd = _value;
                        },
                        validator: (value) {
                          if (value!.length < 4) {
                            return "كلمة المرور لا يمكن ان تكون اقل من 4 احرف";
                          } else {
                            return null;
                          }
                        },
                        obscureText: showPassord,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: "  ادخل كلمة السر  ",
                            labelStyle: TextStyle(
                                color: Colors.blueAccent, fontSize: 25),
                            hintText: " ادخل كلمةالسر الخاصة بك ",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 15),
                            prefixIcon: Icon(Icons.lock_open_rounded),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (showPassord == true) {
                                      showPassord = false;
                                    } else {
                                      showPassord = true;
                                    }
                                    if (showPassord == false) {
                                      _icon = Icon(
                                        Icons.remove_red_eye_rounded,
                                        color: Colors.red,
                                      );
                                    } else {
                                      _icon = Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.green,
                                      );
                                    }
                                  });
                                },
                                icon: _icon)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onSaved: (_value) {
                          _passwordtow = _value;
                        },
                        validator: (value) {
                          if (value!.length < 4) {
                            return "كلمة المرور لا يمكن ان تكون اقل من 4 احرف";
                          }
                          if (value != _passowrd) {
                            return "كلمة المرور غير مطابقة";
                          } else {
                            return null;
                          }
                        },
                        obscureText: showPassord,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: "  تأكيد كلمة السر  ",
                            labelStyle: TextStyle(
                                color: Colors.blueAccent, fontSize: 25),
                            hintText: " تأكيد كلمةالسر الخاصة بك ",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 15),
                            prefixIcon: Icon(Icons.lock_open_outlined),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (showPassord == true) {
                                      showPassord = false;
                                    } else {
                                      showPassord = true;
                                    }
                                    if (showPassord == false) {
                                      _icon = Icon(
                                        Icons.remove_red_eye_rounded,
                                        color: Colors.red,
                                      );
                                    } else {
                                      _icon = Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.green,
                                      );
                                    }
                                  });
                                },
                                icon: _icon)),
                      ),
                    ],
                  )),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 15, left: 70, right: 70, bottom: 10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.green, width: 3)),
                onPressed: () async {
                  await signinfirebase();
                },
                child: Text(
                  " تسجيل الدخول ",
                  style: Theme.of(context).textTheme.headline1,
                ),
                color: Colors.deepPurple,
                splashColor: Colors.red,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
