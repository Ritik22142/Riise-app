import "dart:io";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import "package:rise/main.dart";
import "package:rise/services/flutter_google_signin.dart";
import 'package:image_picker/image_picker.dart';

class create_entry
{
  Future<void> create(name,email,affilation,researchintrest,imageUrl)
  async {
    try {
      // CommanDialog.showLoading();
      var response =
          await FirebaseFirestore.instance.collection('Faculty Details').add({
        // 'user_Id': userCredential.user!.uid,
        'Name': name,
        "Email_address": email,
        "Affiliation" : affilation,
        "Research_Interests" : researchintrest,
        "image_Url" : imageUrl,
      });
      print("Firebase response1111 ${response.id}");
      // CommanDialog.hideLoading();

    } catch (exception) {
      // CommanDialog.hideLoading();
      print("Error Saving Data at firestore $exception");
    }
  }
}

class FacultyFrontPage extends StatefulWidget {
  @override
  State<FacultyFrontPage> createState() => _FacultyFrontPageState();
}

class _FacultyFrontPageState extends State<FacultyFrontPage> {
  File? pickedImage;
  String imageUrl='';
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      print(tempImage);
      setState(() {
        pickedImage = tempImage;
      });
      // print(pickedImage);
      Get.back();
      String uniqueName =DateTime.now().microsecondsSinceEpoch.toString();
      Reference referenceroot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceroot.child('Images');
      Reference referenceImageToUpload = referenceDirImages.child(uniqueName);
      await referenceImageToUpload.putFile(File(tempImage!.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
      print(pickedImage);
    } catch (error) {
      debugPrint(error.toString());
    }
  }





  TextEditingController _nameTEC = TextEditingController();

  TextEditingController _emailTEC = TextEditingController();

  TextEditingController _affilationTEC = TextEditingController();

  TextEditingController _ResearchIntrestTEC = TextEditingController();

  final _formkey=GlobalKey<FormState>();

  @override
  moveToHome(BuildContext context)
  async {
    if(_formkey.currentState!.validate())  {
      create_entry c = create_entry();
      c.create(_nameTEC.text, _emailTEC.text, _affilationTEC.text, _ResearchIntrestTEC.text,imageUrl);
      await FirebaseServices( b : true).googleSignOut();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyPage()),
      );

    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faculty Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.indigo, width: 5),
                          //   borderRadius: const BorderRadius.all(
                          //     Radius.circular(100),
                          //   ),
                          // ),

                          child: ClipOval(
                            child: pickedImage!=null ?Image.file(pickedImage!,
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,):
                            Image.asset("assets/Images/upl.png",
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 5,
                          child: IconButton(
                            onPressed: imagePickerOption,
                            icon: const Icon(
                              Icons.add_a_photo_outlined,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                      key: _formkey,
                      child: Column(
                    children: [
                      TextFormField(
                          controller :_nameTEC,
                          decoration: InputDecoration(
                              hintText: "Enter Name",
                              labelText: "Name"
                          ),
                          validator: (value) {
                            print("username $value");
                            if (value!.length < 1) return 'Name cant be empty';
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          controller :_emailTEC,
                          decoration: InputDecoration(
                              hintText: "Enter Email Address",
                              labelText: "Email Address"
                          ),
                          validator: (value) {
                            print("username $value");
                            if (value!.length < 1) return 'Email Address cant be empty';
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          controller :_affilationTEC,
                          decoration: InputDecoration(
                              hintText: "Enter Affiliation",
                              labelText: "Affiliation"
                          ),
                          validator: (value) {
                            print("username $value");
                            if (value!.length < 1) return 'Affiliation cant be empty';
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          controller :_ResearchIntrestTEC,
                          decoration: InputDecoration(
                              hintText: "Enter Research interests",
                              labelText: "Research interests"
                          ),
                          validator: (value) {
                            print("username $value");
                            if (value!.length < 1) return 'Research interests cant be empty';
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        width: 80,
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () =>moveToHome(context),
                          child: Text('Submit'),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
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
                  ),
                ],
              ),
            ),

          ],

        ),
      ),
            );





  }
}

