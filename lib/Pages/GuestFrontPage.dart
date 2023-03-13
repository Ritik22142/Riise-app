import "package:flutter/material.dart";
import "package:rise/Pages/Faculty_Details.dart";
import "package:rise/main.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "../services/flutter_google_signin.dart";

class FacultyDetail
{
  String Name;
  String af;
  String email;
  String ri;
  String imageUrl;

  FacultyDetail(
      {
        required this.Name,
      required this.af,
        required this.email,
        required this.ri,
        required this.imageUrl,
      }
      );
}


class GuestFrontPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faculty Details"),
        actions: [
          ElevatedButton(
          onPressed: () async{
          await FirebaseServices( b : true).googleSignOut();
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyPage())
            );
          },
              child: Text("Log Out"))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Faculty Details").snapshots(),
        builder: (context,snapshot){
          return ListView.builder(
          itemCount: snapshot.data?.docs.length,
          itemBuilder: (BuildContext context, int index) {
          DocumentSnapshot faculty_details = snapshot.data?.docs[index] as DocumentSnapshot<Object?>;
          // FacultyDetail f = FacultyDetail(Name: faculty_details['Name'].toString(), af: faculty_details['Affiliation'].toString(),);
          FacultyDetail f = FacultyDetail(Name: faculty_details['Name'].toString(), af: faculty_details['Affiliation'].toString(), email: faculty_details['Email_address'].toString(), ri: faculty_details['Research_Interests'].toString(), imageUrl: faculty_details["image_Url"].toString());
          return Card(
            child: ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(f.imageUrl),
                radius: 25,),
            title: Text(faculty_details['Name']),
              subtitle: Text(faculty_details['Affiliation']),
              trailing: Icon(Icons.arrow_forward_rounded),

              onTap:() {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>FacultyDetailScreen(f)));
              },

      ),
          );
    },

          );
    }


      )
      // child: Center(child: Text("This is front page of Guest")),
    );
  }
}
