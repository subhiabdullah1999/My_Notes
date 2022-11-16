import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:my_notes/screens/auth/sms_code_screen.dart';

import '../../functions/functions.dart';
import '../notesScreens/notes_home.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  var _password, _email;
  bool showPassord = true;
  Icon _icon = Icon(
    Icons.remove_red_eye,
    color: Colors.green,
  );

  Future logIn() async {
    var dataForm = formKey.currentState;
    if (dataForm != null) {
      dataForm.save();
    }
    if (dataForm!.validate()) {
      try {
        showDialogLoading(context);
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        if (credential != null) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NotesHome()));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              btnOk: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("loginScreen");
                  },
                  child: Text("ok")),
              btnOkColor: Colors.green,
              body: Text(
                " لايوجد مستخدم مسجل بهذا البريد الرجاء الذهاب الى صفحة انشاء الحساب وانشاء حساب لهذا البريد الالكتروني ",
                style: TextStyle(color: Colors.purpleAccent, fontSize: 20),
              ))
            ..show();
          Future.delayed(Duration(seconds: 8), () {
            Navigator.of(context).pop();
          });
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              btnOk: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("loginScreen");
                  },
                  child: Text("ok")),
              btnOkColor: Colors.green,
              body: Text(
                "  كلمة المرور خاطئة الرجاء ادخال كلمة المرور الصحيحة لهذا البريد الالكتوني  ",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ))
            ..show();
          Future.delayed(Duration(seconds: 8), () {
            Navigator.of(context).pop();
          });
        }
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
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          body: ListView(
            children: [
              Container(
                child: Image(image: AssetImage("assets/images/loginimage.png")),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 35, left: 35, right: 35, bottom: 10),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
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
                            labelStyle: TextStyle(
                                color: Colors.blueAccent, fontSize: 25),
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
                            _password = _value;
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
                        //
                      ],
                    )),
              ),
              Container(
                padding: EdgeInsets.only(right: 35, left: 35),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("sigininScreen");
                      },
                      child: Text(
                        " اضغط هنا ",
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Text(
                      " اذا لم يكن لديك حساب ",
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 15, left: 70, right: 70, bottom: 10),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.green, width: 3)),
                  onPressed: () async {
                    await logIn();
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
              Container(
                padding:
                    EdgeInsets.only(top: 15, left: 70, right: 70, bottom: 10),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.green, width: 3)),
                  onPressed: () {
                    Navigator.of(context).pushNamed("sigininScreen");
                  },
                  child: Text(
                    " انشاء حساب ",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  color: Colors.deepPurple,
                  splashColor: Colors.red,
                  height: 50,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
