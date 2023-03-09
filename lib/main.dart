import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rise/Pages/GuestLoginPage.dart';
import 'package:rise/Pages/ui_page.dart';
import 'Pages/FacultyFrontPage.dart';
import 'Pages/FacultyLoginPage.dart';
import 'Pages/GuestFrontPage.dart';
import "package:get/get.dart";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyPage()
    );
  }
}
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("RIISE APP"),
        backgroundColor: Colors.teal[500],
      ),
      body: Column(
        children: [
        Row(
        children: [
        Expanded(
        child: Image.asset(
          'assets/Images/RIISE.png',
          fit: BoxFit.cover,
        ),
      ),
      ],
      ),
      SizedBox(
        height: 90,
      ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FacultyLoginPage()),
                    );
                  },
                  child: Text('Faculty Login'),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GuestLoginPage()),
                      );
                    },
                  child: Text('Guest Login'),
                ),
              ),
            ],
          ),
    ]
      ),
    );
  }
}







