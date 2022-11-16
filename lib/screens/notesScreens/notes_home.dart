import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

class NotesHome extends StatefulWidget {
  const NotesHome({Key? key}) : super(key: key);

  @override
  State<NotesHome> createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed("loginScreen");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  signOut();
                },
                icon: Icon(Icons.exit_to_app),
                iconSize: 35,
                color: Colors.red,
              ),
            ],
            title: Text(
              " ملاحظاتي  ",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Courgette-Regular",
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            centerTitle: true,
          ),
          floatingActionButton: FabCircularMenu(
              ringColor: Colors.purple,
              fabCloseColor: Colors.red,
              fabOpenColor: Colors.greenAccent,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed("settingScreen");
                    },
                    icon: Icon(
                      Icons.settings,
                      size: 25,
                      color: Colors.white,
                    ),
                    label: Text(
                      "الاعدادات",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed("addnoteScreen");
                    },
                    icon: Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.white,
                    ),
                    label: Text(
                      "اضافة ملاحظة",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed("appAbout");
                    },
                    icon: Icon(
                      Icons.description,
                      size: 25,
                      color: Colors.white,
                    ),
                    label: Text(
                      "حول التطبيق",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed("developerScreen");
                    },
                    icon: Icon(
                      Icons.person_pin,
                      size: 25,
                      color: Colors.white,
                    ),
                    label: Text(
                      "المطور",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
              ]),
          body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: Key("$index"), child: CardNotes(context));
              }),
        ),
      ),
    );
  }

  Card CardNotes(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            width: 3,
            color: Colors.black26,
          )),
      child: ListTile(
        isThreeLine: true,
        leading: CircleAvatar(
          radius: 30,
        ),
        trailing: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("editeNoteScreen");
            },
            icon: Icon(
              Icons.edit,
              color: Colors.blue,
            ),
            splashColor: Colors.green),
        title: Text("Note"),
        subtitle: Text("Hello hello hello"),
      ),
    );
  }
}
