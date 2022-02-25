import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

import '../services/google_sign_in_provider.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser!;
    TextStyle textstyle = const TextStyle(fontSize: 16);
    return Scaffold(
      appBar: AppBar(
        leading: const MenuWidgetButton(),
        title: const Text('User Profile'),
        actions: [
          TextButton(
            child: const Text('Logout'),
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

class MenuWidgetButton extends StatelessWidget {
  const MenuWidgetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => ZoomDrawer.of(context)!.toggle(),
        icon: const Icon(Icons.menu));
  }
}
