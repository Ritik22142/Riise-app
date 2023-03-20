import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'fetch_data.dart';
import 'insert_data.dart';
// import 'package:crud_ops_flutter/screens/fetch_data.dart';
// import 'package:crud_ops_flutter/screens/insert_data.dart';

//Firebase project name "flutter-Login-DemoPage"

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD Ops Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty/Guest Page'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Image(
              width: 300,
              height: 300,
              image: NetworkImage(
                  'https://iiitd.ac.in/riise2022/assets/img/riise2022logo15059.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InsertData()));
              },
              color: Colors.teal[400],
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
              child: const Text('Create Profile'),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FetchData()));
              },
              color: Colors.teal[400],
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
              child: const Text('Fetch Profiles'),
            ),
          ],
        ),
      ),
    );
  }
}
