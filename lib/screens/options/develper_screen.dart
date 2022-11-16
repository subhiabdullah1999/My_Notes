import 'package:flutter/material.dart';

class DeveloperScreen extends StatefulWidget {
  const DeveloperScreen({Key? key}) : super(key: key);

  @override
  State<DeveloperScreen> createState() => _AppAboutState();
}

class _AppAboutState extends State<DeveloperScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            " المطور ",
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
            UserAccountsDrawerHeader(
              margin: EdgeInsets.all(15),
              arrowColor: Colors.green,
              accountName: Text(
                "   صبحي عبدالعزيز عبدالله ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
              accountEmail: Text(
                " مهندس معلوماتية قسم الذكاء الصنعي ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/my.jpg"),
              ),
            ),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(
                    "ايميل المطور",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    " subhiabdullah1999@gmail.com",
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr,
                  ),
                  trailing: Icon(Icons.email_rounded),
                  isThreeLine: true,
                )),
            Divider(
              color: Colors.blueGrey,
              thickness: 2,
            ),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(
                    " رقم الواتس اب ",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    " +963936798549",
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr,
                  ),
                  trailing: Icon(Icons.phone_android_sharp),
                  isThreeLine: true,
                )),
            Divider(
              color: Colors.blueGrey,
              thickness: 2,
            ),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(
                    " حساب الفيس بوك",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    " subhiabdullah1999@gmail.com",
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr,
                  ),
                  trailing: Icon(Icons.facebook_rounded),
                  isThreeLine: true,
                )),
            Divider(
              color: Colors.blueGrey,
              thickness: 2,
            ),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(
                    " حساب التيلغرام ",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                    " subhiabdullah1999@gmail.com",
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr,
                  ),
                  trailing: Icon(Icons.telegram),
                  isThreeLine: true,
                )),
            Divider(
              color: Colors.blueGrey,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
