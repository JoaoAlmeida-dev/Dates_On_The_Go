import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/menu_item.dart';
import '../models/menu_items.dart';
import '../services/google_sign_in_provider.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuHeader(),
                const Spacer(flex: 1),
                ...MenuItems.all.map(BuildMenuItem).toList(),
                const Spacer(
                  flex: 2,
                ),
                LogoutListTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MenuHeader() {
    final User user = FirebaseAuth.instance.currentUser!;
    return Builder(builder: (context) {
      MediaQueryData mediaQueryData = MediaQuery.of(context);
      double screenWidth = mediaQueryData.size.width;
      double heigth = mediaQueryData.size.height;

      return Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          width: screenWidth * 0.4,
          //height: heigth * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(140),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColorDark,
                      spreadRadius: 3,
                      blurRadius: 2,
                      //offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: screenWidth * (0.25 / 3),
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: screenWidth * 0.3,
                child: Text(user.displayName.toString()),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget BuildMenuItem(MenuItem item) => Builder(builder: (context) {
        return ListTileTheme(
          selectedColor: Theme.of(context).toggleableActiveColor,
          child: ListTile(
            selectedTileColor: Theme.of(context).highlightColor,
            selected: currentItem == item,
            minLeadingWidth: 20,
            leading: Icon(item.icon),
            title: Text(item.title),
            onTap: () {
              onSelectedItem(item);
            },
          ),
        );
      });

  Widget LogoutListTile() => Builder(builder: (context) {
        return ListTile(
          minLeadingWidth: 5,
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogout();
          },
        );
      });
}
