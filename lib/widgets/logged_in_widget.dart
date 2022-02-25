import 'package:dates_on_the_go/services/google_sign_in_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser!;
    TextStyle textstyle = const TextStyle(fontSize: 16);

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text('Logout'),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogout();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Profile',
              style: textstyle,
            ),
            const Spacer(),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const Spacer(),
            Text('Name: ' + user.displayName.toString(), style: textstyle),
            Text('Email: ' + user.email.toString(), style: textstyle),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
