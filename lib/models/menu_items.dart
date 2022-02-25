import 'package:flutter/material.dart';

import 'menu_item.dart';

class MenuItems {
  static const profile = MenuItem('Profile', Icons.person);
  static const promos = MenuItem('Promos', Icons.card_giftcard);
  static const notifications =
      MenuItem('Notifications', Icons.notification_important);
  static const help = MenuItem('Help', Icons.help);
  static const aboutUs = MenuItem('AboutUs', Icons.info);
  static const rateUs = MenuItem('RateUs', Icons.star_border);

  static const all = <MenuItem>[
    profile,
    promos,
    notifications,
    help,
    aboutUs,
    rateUs,
  ];
}
