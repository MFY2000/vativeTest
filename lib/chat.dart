import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String _myId = "aaa";
  List<Map<String, dynamic>> messages = [];
  final _db = FirebaseDatabase.instance.ref();

  TextEditingController messageInput = TextEditingController();

  @override
  void initState() {
    _retrieveDataFromFirebase();
    super.initState();

    _db.child('').once().then((snapshot) {
      dynamic values = snapshot.snapshot.value ?? {};
      values.forEach((key, value) {
        setState(() {
          print(value);
          messages.add({
            "Text": value[1]['Text'] ?? "",
            "Type": value[1]['Type'] == _myId
          });
        });
      });
    });
  }

  void _retrieveDataFromFirebase() {}

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          return snapshot.hasError
              ? Text(snapshot.error.toString())
              : Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: messages.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Container(
                            padding: EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 10),
                            child: Align(
                                alignment: (messages[index]["Type"] == 0
                                    ? Alignment.topLeft
                                    : Alignment.topRight),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: (messages[index]["Type"] == 0
                                        ? Colors.grey.shade200
                                        : Colors.blue[200]),
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    messages[index]["Text"],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: messageInput,
                            decoration: const InputDecoration(
                              hintText: 'Enter a message',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: sendMessage,
                        ),
                      ],
                    ),
                  ],
                );
        });
  }

  sendMessage() {
    setState(() {
      // messages.add({"Text": messageInput.text, "Type": 1});
      _db.child('Massages').push().set({
        {"Text": messageInput.text, "Type": _myId}
      });
      messageInput.clear();
    });
  }
}
