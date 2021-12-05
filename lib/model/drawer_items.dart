import 'package:animation_course/model/drawer_item.dart';
import 'package:flutter/material.dart';


class DrawerItems{

  static const  home = DrawerItem(icon: Icons.home, title: 'Home');
  static const  explore = DrawerItem(icon: Icons.search, title: 'Explore');
  static const  profile = DrawerItem(icon: Icons.person, title: 'Profile');
  static const  messages = DrawerItem(icon: Icons.message, title: 'Messages');
  static const  settings = DrawerItem(icon: Icons.settings, title: 'Settings');

  static final List<DrawerItem> all = [
    home , explore , profile, messages, settings
  ];


}