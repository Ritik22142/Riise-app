// import 'dart:html';
import "dart:io";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
// import "package:rise/Pages/faculty_model.dart";
// import "package:rise/main.dart";
// import "package:rise/services/flutter_google_signin.dart";
import 'package:image_picker/image_picker.dart';
// import 'package:rise/Pages/GuestFrontPage.dart';
// import "GuestFrontPage.dart";
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateRecord extends StatefulWidget {
  const UpdateRecord({Key? key, required this.studentKey}) : super(key: key);

  final String studentKey;

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {
  File? pickedImage;
  String imageUrl = '';
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
      String uniqueName = DateTime.now().microsecondsSinceEpoch.toString();
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

  final userUniqueIDController = TextEditingController();
  final userMobileMessagingTokenIDController = TextEditingController();
  final userNameController = TextEditingController();
  final userPositionController = TextEditingController();
  final userDepartmentController = TextEditingController();
  final userCollegeController = TextEditingController();
  final userMobileNumberController = TextEditingController();
  final userResearchInterestController = TextEditingController();
  final userAffiliatedCentresController = TextEditingController();
  final userEmailIDController = TextEditingController();
  final userGenderController = TextEditingController();
  final userBioController = TextEditingController();
  final userImageURLController = TextEditingController();
  final userLinkedInURLController = TextEditingController();
  final userWebsiteURLController = TextEditingController();
  final userOfficeAddressController = TextEditingController();
  final userOfficeLongitudeController = TextEditingController();
  final userOfficeLatitudeController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Profiles');
    getStudentData();
  }

  void getStudentData() async {
    DataSnapshot snapshot = await dbRef.child(widget.studentKey).get();

    Map student = snapshot.value as Map;

    userUniqueIDController.text = student['faculty_uniqueID'];
    userMobileMessagingTokenIDController.text =
        student['faculty_mobile_messaging_token_ID'];
    userNameController.text = student['faculty_name'];
    userPositionController.text = student['faculty_position'];
    userDepartmentController.text = student['faculty_department'];
    userCollegeController.text = student['faculty_college'];
    userMobileNumberController.text = student['faculty_mobile_number'];
    userResearchInterestController.text = student['faculty_research_interests'];
    userAffiliatedCentresController.text =
        student['faculty_affiliated_centres_and_labs'];
    userEmailIDController.text = student['faculty_emailID'];
    userGenderController.text = student['faculty_gender'];
    userBioController.text = student['faculty_bio'];
    userImageURLController.text = student['faculty_imageURL'];
    userLinkedInURLController.text = student['faculty_linkedInURL'];
    userWebsiteURLController.text = student['faculty_websiteURL'];
    userOfficeAddressController.text = student['faculty_office_address'];
    userOfficeLongitudeController.text = student['faculty_office_longitudeL'];
    userOfficeLatitudeController.text = student['faculty_office_latitude'];
  }

  @override
  Widget build(BuildContext context) {
    String image = userImageURLController.text.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Updating Profile Data'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                        child: ClipOval(
                          child: pickedImage != null
                              ? Image.file(
                                  pickedImage!,
                                  width: 170,
                                  height: 170,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  // userImageURLController.text,
                            image,

                            //   imageUrl,
                            // 'https://iiitd.ac.in/riise2022/assets/img/riise2022logo15059.png',
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
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: userUniqueIDController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Unique ID',
                    hintText: 'Faculty_UniqueID',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                TextField(
                  controller: userMobileMessagingTokenIDController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Messaging Token',
                    hintText: 'Faculty_mobile_messaging_tokenID',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Faculty_Name',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                //

                TextField(
                  controller: userPositionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Position',
                    hintText: 'Faculty_Position',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                TextField(
                  controller: userDepartmentController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Department',
                    hintText: 'Faculty_Department',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                TextField(
                  controller: userCollegeController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'College',
                    hintText: 'Faculty_College',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                TextField(
                  controller: userMobileNumberController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile Number',
                    hintText: 'Faculty_Number',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: userResearchInterestController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Research Interests',
                    hintText: 'Faculty_Interests',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                TextField(
                  controller: userAffiliatedCentresController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Affiliated Centres and Labs',
                    hintText: 'Faculty_centres_and_labs',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                TextField(
                  controller: userEmailIDController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail ID',
                    hintText: 'Faculty_Email-ID',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: userGenderController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Gender',
                    hintText: 'Faculty_Gender',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: userBioController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bio',
                    hintText: 'Faculty_Bio',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                TextField(
                  controller: userImageURLController,
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Image_URL',
                    hintText: 'Faculty_image_url',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: userLinkedInURLController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'LinkedIn URL',
                    hintText: 'Faculty_linkedin_url',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                TextField(
                  controller: userWebsiteURLController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Website URL',
                    hintText: 'Faculty_website',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                TextField(
                  controller: userOfficeAddressController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Office Address',
                    hintText: 'Faculty_office_address',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: userOfficeLongitudeController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Office Longitude',
                    hintText: 'latitude',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: userOfficeLatitudeController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Office Latitude',
                    hintText: 'longitude',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                MaterialButton(
                  onPressed: () {
                    Map<String, String> students = {
                      'faculty_uniqueID': userUniqueIDController.text,
                      'faculty_mobile_messaging_token_ID':
                          userMobileMessagingTokenIDController.text,
                      'faculty_name': userNameController.text,
                      'faculty_position': userPositionController.text,
                      'faculty_department': userDepartmentController.text,
                      'faculty_college': userCollegeController.text,
                      'faculty_mobile_number': userMobileNumberController.text,
                      'faculty_research_interests':
                          userResearchInterestController.text,
                      'faculty_affiliated_centres_and_labs':
                          userAffiliatedCentresController.text,
                      'faculty_emailID': userEmailIDController.text,
                      'faculty_gender': userGenderController.text,
                      'faculty_bio': userBioController.text,
                      'faculty_linkedInURL': userLinkedInURLController.text,
                      'faculty_websiteURL': userWebsiteURLController.text,
                      'faculty_office_address':
                          userOfficeAddressController.text,
                      'faculty_office_longitude':
                          userOfficeLongitudeController.text,
                      'faculty_office_latitude':
                          userOfficeLatitudeController.text,
                    };
                    if(imageUrl=="")
                      students['faculty_imageURL'] = userImageURLController.text;
                    else
                      students['faculty_imageURL'] = imageUrl;


                    dbRef
                        .child(widget.studentKey)
                        .update(students)
                        .then((value) => {Navigator.pop(context)});
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 300,
                  height: 40,
                  child: const Text('Update Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
