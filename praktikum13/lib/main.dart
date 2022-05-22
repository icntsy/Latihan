import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:praktikum13/page/user_page.dart';
import 'package:praktikum13/model/user.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Praktikum 13';
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.pink),
        home: MainPageState(),
      );
}

class MainPageState extends StatefulWidget {
  @override
  _MainPageStateState createState() => _MainPageStateState();
}

class _MainPageStateState extends State<MainPageState> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('All Users'),
        ),
        body: StreamBuilder<List<User>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            // if (snapshot.hasError) {
            //   return Text('Error! ${snapshot.error}');
            // } else if (snapshot.hasData) {
            //   final users = snapshot.data!;
            if (snapshot.hasError) {
              return Center(
                child: Text('Error'),
              );
            } else if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => UserPage()));
            }),
      );

  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(child: Text('${user.age}')),
        title: Text(user.name),
        subtitle: Text(user.birthday.toIso8601String()),
      );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
  // Stream<List<User>> readUser() => FirebaseFirestore.instance
  //   .collection('users')
  //   .snapshots()
  //   .map((snapshot) =>
  //     snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final user = User(
      id: docUser.id,
      name: name,
      age: 21,
      birthday: DateTime(2001, 8, 24),
    );
    final json = user.toJson();
    await docUser.set(json);
  }
}
// class User {
//   String id;
//   final String name;
//   final int age;
//   final DateTime birthday;

//   User({
//     this.id = '',
//     required this.name,
//     required this.age,
//     required this.birthday,
//   });
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'name': name,
//     'age': age,
//     'birthday': birthday,
//   };
// }
