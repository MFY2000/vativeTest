import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vativetest/login.dart';
import 'package:vativetest/news.dart';
import 'package:vativetest/chat.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  final List<String> noOfQuestion = [
    "Implement a login screen with validation in Flutter. The screen should have two text fields, one for the username and another for the password. The password field should be obscured. The validation should ensure that both fields are not empty and that the password is at least 8 characters long. If either of these conditions are not met, show an error message below the relevant text field. Use SQLite for credentials storage.",
    "mplement a chat interface in Flutter that supports real-time messaging using a backend service such as Firebase. The interface should allow the user to send and receive messages.",
    "Use NewsAPI (https://newsapi.org/) to show news in the app. Demonstrate your API implementation. (Preferred Dio Library)"
  ];

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: List.generate(noOfQuestion.length,
                (index) => Tab(text: 'Question ${index + 1}')),
          ),
        ),
        body: TabBarView(
          children: List.generate(
              noOfQuestion.length,
              (index) => SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.05),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.05),
                          child: Text(noOfQuestion[index]),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: index == 0
                              ? const loginScreen()
                              : index == 1
                                  ? const ChatScreen()
                                  : NewsScreen(),
                        )
                      ]),
                    ),
                  )),
        ),
      ),
    );
  }
}
