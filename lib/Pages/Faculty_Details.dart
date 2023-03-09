import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise/Pages/GuestFrontPage.dart';

class FacultyDetailScreen extends StatelessWidget {
  final FacultyDetail f;
  FacultyDetailScreen(this.f);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(f.Name),
      ),
      body: Padding(
          padding:const EdgeInsets.all(0),
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
                      Image.network(
                        f.imageUrl,
                        // fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                          f.Name,
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
                  title: Text(f.ri,
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
                  title: Text(f.af,
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
        // child: SingleChildScrollView(
        //   child: Column(
        //     // mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       SizedBox(
        //         height: 50,
        //       ),
        //       Center(
        //         child: CircleAvatar(
        //           backgroundImage: NetworkImage(f.imageUrl),
        //           radius: 100,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 30,
        //         // width: 250,
        //         // child: Divider(color: Colors.black),
        //       ),
        //       Center(child: Text(f.Name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500))),
        //       // Padding(
        //       //   padding: const EdgeInsets.symmetric(vertical: 50.0),
        //       //   child: Column(
        //       //     mainAxisAlignment: MainAxisAlignment.end,
        //       //     children: [
        //       //       Text("Email    " + f.email,style: TextStyle(fontSize: 20),),
        //       //       Text("Research    " + f.ri,style: TextStyle(fontSize: 20)),
        //       //       Text("Affiliation    " + f.af,style: TextStyle(fontSize: 20))
        //       //     ],
        //       //   ),
        //       // )
        //       Card(
        //         color: Colors.white,
        //         margin: EdgeInsets.symmetric(vertical: 12.0,horizontal: 20.0),
        //         child: Padding(padding: EdgeInsets.all(16),
        //             child: Row(
        //               children: [
        //                 Icon(Icons.email),
        //                 SizedBox(width: 20.0,),
        //                 Text(f.email,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400))
        //               ],
        //             ),
        //         ),
        //        ),
        //       Card(
        //         color: Colors.white,
        //         margin: EdgeInsets.symmetric(vertical: 12.0,horizontal: 20.0),
        //         child: Padding(padding: EdgeInsets.all(16),
        //           child: Row(
        //             children: [
        //               Icon(Icons.search),
        //               SizedBox(width: 20.0,),
        //               Text(f.ri,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400))
        //             ],
        //           ),
        //         ),
        //       ),
        //       Card(
        //         color: Colors.white,
        //         margin: EdgeInsets.symmetric(vertical: 12.0,horizontal: 20.0),
        //         child: Padding(padding: EdgeInsets.all(16),
        //           child: Row(
        //             children: [
        //               Icon(Icons.message_rounded),
        //               SizedBox(width: 20.0,),
        //               Text(f.af,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400))
        //             ],
        //           ),
        //         ),
        //       ),
        //
        //     ],
        //   ),
        // ),
      ),
    );
    TableRow buildRow(List<String> cells) =>TableRow(
      children: cells.map((cell) => Text(cell)).toList()
    );
  }
}
