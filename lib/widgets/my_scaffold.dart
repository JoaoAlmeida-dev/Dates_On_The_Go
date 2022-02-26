import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:logger/logger.dart';

class My_Scaffold extends StatelessWidget {
  My_Scaffold({Key? key, required this.body, required this.title})
      : super(key: key);
  static final Logger _logger = Logger();

  Widget body;
  Widget title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragEnd: (dragEndDetails) {
          // Note: Sensitivity is integer used when you don't want to mess up vertical drag
          _logger.d(dragEndDetails.primaryVelocity);
          if (dragEndDetails.primaryVelocity! > 2000) {
            // Left Swipe
            ZoomDrawer.of(context)!.open();
          } else if (dragEndDetails.primaryVelocity! < 2000) {
            // Left Swipe
            ZoomDrawer.of(context)!.close();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: MenuWidgetButton(),
            title: title,
          ),
          body: body,
        ));
  }
}

Widget MenuWidgetButton() => Builder(builder: (context) {
      return IconButton(
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
          icon: const Icon(Icons.menu));
    });
