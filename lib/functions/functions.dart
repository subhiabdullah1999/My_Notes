import 'package:flutter/material.dart';

showDialogLoading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "الرجاء الانتظار لحظة من فضلك",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          content: Container(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      });
}
