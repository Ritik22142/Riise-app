import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ui extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.teal,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
              // color: Colors.white,
              width: 180,
              // height: 200,
              child: Column(
                // fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/Images/pp.png',
                    // fit: BoxFit.fitWidth,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      'A V Subramanyam',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      'Associate Professor (ECE, CSE)',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,

                      ),
                    ),
                  ),
                ],
              ),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 3),

              ),
            ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(Icons.school,color: Colors.white,size: 30,),
                title: Text("PhD (2012), Nanyang Technological University, Singapore",
                // textScaleFactor: 1.4,
                style: TextStyle(
                  color: Colors.white
              ),
                ),
                ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                // leading: Icon(Icons.school,color: Colors.white,size: 30,),
                title: Text("Contact Details",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                      color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                leading: Icon(Icons.perm_phone_msg,color: Colors.white,size: 30,),
                title: Text("+91 011-26907437",
                  // textScaleFactor: 1.4,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.email_outlined,color: Colors.white,size: 30,),
                title: Text("subramanyam@iiitd.ac.in",
                  // textScaleFactor: 1.4,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.location_solid,color: Colors.white,size: 30,),
                title: Text("B-604 (R&D Block)",
                  // textScaleFactor: 1.4,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              ListTile(
                // leading: Icon(Icons.school,color: Colors.white,size: 30,),
                title: Text(" Research Interests",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                // leading: Icon(Icons.format_list_bulleted,color: Colors.white,size: 30,),
                title: Text("Multimedia and Vision, Machine Learning",
                  // textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                // leading: Icon(Icons.school,color: Colors.white,size: 30,),
                title: Text(" Affiliated Centres & Labs",
                  textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                // leading: Icon(Icons.format_list_bulleted,color: Colors.white,size: 30,),
                title: Text("Infosys Centre for Artificial Intelligence (CAI),Visual Conception Group",
                  // textScaleFactor: 1.4,
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(

                  onPressed: () { },
                  child: Text("Send Email Appointment"),
                style : ElevatedButton.styleFrom(
                primary: Colors.orange,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
