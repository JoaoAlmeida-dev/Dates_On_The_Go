import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../widgets/my_scaffold.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);
  static final Logger _logger = Logger();
  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser!;
    TextStyle textstyle = const TextStyle(fontSize: 16);
    return My_Scaffold(
      title: const Text('Profile Page'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const Spacer(),
            Text('Name: ' + user.displayName.toString(), style: textstyle),
            Text('Email: ' + user.email.toString(), style: textstyle),
            Text('UserID: ' + user.uid.toString()),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
