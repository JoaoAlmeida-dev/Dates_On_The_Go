import 'package:dates_on_the_go/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../models/menu_item.dart';
import '../models/menu_items.dart';
import '../pages/profile_widget.dart';

class LoggedInWidget extends StatefulWidget {
  LoggedInWidget({Key? key}) : super(key: key);

  @override
  State<LoggedInWidget> createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  MenuItem currentItem = MenuItems.profile;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      borderRadius: 40,
      slideWidth: MediaQuery.of(context).size.width * 0.6,
      angle: -5,
      showShadow: true,
      shadowLayer1Color: Theme.of(context).primaryColor,
      shadowLayer2Color: Theme.of(context).backgroundColor,
      mainScreen: getScreen(),
      menuScreen: Builder(builder: (context) {
        return MenuWidget(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            });
      }),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.profile:
        return ProfileWidget();
      default:
        return ProfileWidget();
    }
  }
}
