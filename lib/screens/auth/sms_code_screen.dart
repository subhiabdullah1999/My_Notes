// import 'dart:ui';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:my_notes/screens/notesScreens/notes_home.dart';
// import 'package:pinput/pinput.dart';

// class SmsCodeScreen extends StatefulWidget {
//   final String useremail;

//   const SmsCodeScreen(String text, {Key? key, required this.useremail})
//       : super(key: key);

//   @override
//   State<SmsCodeScreen> createState() => _SmsCodeScreenState();
// }

// class _SmsCodeScreenState extends State<SmsCodeScreen> {
//   var _pinValue;
//   TextEditingController _pinController = TextEditingController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   String? _verficationCode;

//   Future verifictionPhoneNumber() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: widget.useremail,
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await FirebaseAuth.instance
//               .signInWithCredential(credential)
//               .then((value) async {
//             if (value.user != null) {
//               Navigator.of(context).pushReplacementNamed("noteshome");
//             }
//           });
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.message);
//         },
//         codeSent: (String verificationId, int? resend) {
//           setState(() {
//             _verficationCode = verificationId;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           setState(() {
//             _verficationCode = verificationId;
//           });
//         },
//         timeout: Duration(seconds: 60));
//   }

//   @override
//   void initState() {
//     verifictionPhoneNumber();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: ListView(
//           children: [
//             Container(
//               child: Image(
//                 image: AssetImage(
//                   "assets/images/smscodeimage.png",
//                 ),
//                 fit: BoxFit.fill,
//               ),
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                 top: 20,
//                 left: 40,
//                 right: 40,
//               ),
//               child: Form(
//                   child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "ادخل رمز التحقق الذي تم ارساله الى الايميل : ${widget.useremail} ",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       fontStyle: FontStyle.italic,
//                     ),
//                     textDirection: TextDirection.rtl,
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Pinput(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     length: 6,
//                     defaultPinTheme: PinTheme(
//                         height: 50.0,
//                         width: 50.0,
//                         textStyle: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           fontStyle: FontStyle.italic,
//                         ),
//                         decoration: BoxDecoration(
//                             shape: BoxShape.rectangle,
//                             color: Colors.purple,
//                             border: Border.all(color: Colors.green, width: 2))),
//                     onCompleted: (pin) async {
                      
//                       // try {
//                       //   await FirebaseAuth.instance
//                       //       .signInWithCredential(PhoneAuthProvider.credential(
//                       //           verificationId: _verficationCode ?? "",
//                       //           smsCode: pin))
//                       //       .then((value) async {
//                       //     print(value.user!.phoneNumber);
//                       //     if (value.user != null) {
//                       //       AwesomeDialog(
//                       //           context: context,
//                       //           dialogType: DialogType.SUCCES,
//                       //           body: Text(
//                       //             "تم تسجيل الدخول بنجاح",
//                       //             style: TextStyle(
//                       //                 color: Colors.purpleAccent, fontSize: 20),
//                       //           ))
//                       //         ..show();
//                       //       Future.delayed(Duration(seconds: 3), () {
//                       //         Navigator.of(context)
//                       //             .pushReplacementNamed("noteshome");
//                       //       });
//                       //     }
//                       //   });
//                       // } catch (e) {
//                       //   AwesomeDialog(
//                       //       context: context,
//                       //       dialogType: DialogType.ERROR,
//                       //       btnOk: ElevatedButton(
//                       //           onPressed: () {
//                       //             Navigator.of(context).pop();
//                       //           },
//                       //           child: Text("ok")),
//                       //       btnOkColor: Colors.green,
//                       //       body: Text(
//                       //         "  رمز التحقق خاطئ",
//                       //         style:
//                       //             TextStyle(color: Colors.green, fontSize: 15),
//                       //       ))
//                       //     ..show();
//                       //   Future.delayed(Duration(seconds: 4), () {
//                       //     Navigator.of(context).pop();
//                       //   });
//                       // }
//                     },
//                   ),
//                 ],
//               )),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   //
// }
