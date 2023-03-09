// TODO Implement this library.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rise/Pages/FacultyFrontPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rise/Pages/GuestFrontPage.dart';

import '../services/flutter_google_signin.dart';


class FacultyLoginPage extends StatelessWidget {
  final _formkey=GlobalKey<FormState>();
  @override
  moveToHome(BuildContext context)
  {
    if(_formkey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FacultyFrontPage()),
      );

    }

  }
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/Images/logo2.png",fit: BoxFit.cover),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 20),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter UserName",
                              labelText: "UserName"
                          ),
                          validator: (value) {
                            print("username $value");
                            if (value!.length < 1) return 'UserName cant be empty';
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password"
                          ),
                          validator: (value){
                            print("password $value");
                            if (value!.length < 1) return 'password cant be empty';
                            // return null;
                            if(value.length <8)
                              return "Password length must be greater than 8";
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 70,
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () =>moveToHome(context),
                          child: Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton.extended(
                  onPressed: () async{


                    FirebaseServices f = FirebaseServices(b: false);
                    print(f.b);
                    await f.signInWithGoogle();
                    if(f.b) {
                      print("sdfsdfs $f.b");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FacultyFrontPage())
                      );
                    }
                  },
                  icon: Image.asset("assets/Images/google_icon.png",
                    height: 32,
                    width: 32,),
                  label: Text("Sign in with Google"),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              ),
            ],

          ),
        )
    );
  }
}

