import 'package:flutter/material.dart';

class Settingsscreen extends StatefulWidget {
  const Settingsscreen({Key? key}) : super(key: key);

  @override
  State<Settingsscreen> createState() => _SettingsscreenState();
}

class _SettingsscreenState extends State<Settingsscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            " الاعدادات  ",
            style: TextStyle(
                fontSize: 30,
                fontFamily: "Courgette-Regular",
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Text(
                        " الوضع المظلم ",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Courgette-Regular",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                        textDirection: TextDirection.rtl,
                      ),
                      trailing: Icon(
                        Icons.dark_mode,
                        size: 35,
                      ),
                      leading: Switch(value: false, onChanged: (swit) {}),
                    )),
              ),
              Divider(
                color: Colors.blue,
                thickness: 2,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Text(
                        " حجم الخط ",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Courgette-Regular",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                        textDirection: TextDirection.rtl,
                      ),
                      trailing: Icon(
                        Icons.text_decrease,
                        size: 35,
                      ),
                    )),
              ),
              Divider(
                color: Colors.blue,
                thickness: 2,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed("loginScreen");
                },
                child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Text(
                        " تسجيل الخروج",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Courgette-Regular",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                        textDirection: TextDirection.rtl,
                      ),
                      trailing: Icon(
                        Icons.logout,
                        size: 35,
                      ),
                    )),
              ),
              Divider(
                color: Colors.blue,
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
