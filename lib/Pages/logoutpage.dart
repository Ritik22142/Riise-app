import "package:flutter/material.dart";
import "package:rise/services/flutter_google_signin.dart";
import "FacultyFrontPage.dart";


class logoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ElevatedButton(
        onPressed: () async{
          await FirebaseServices(b:true).googleSignOut();
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FacultyFrontPage())
          );
        },
        child: Text("LOG OUT"),

      ),
    );
  }
}
