import 'package:flutter/material.dart';

class BottomBarItem extends BottomNavigationBarItem {
  final String initialLocation;
  final Widget actvIcon;
  final Widget inactiveIcon;
  final String? title;

  BottomBarItem(
      {required this.initialLocation,
      required this.actvIcon,
      required this.inactiveIcon,
      this.title})
      : super(icon: inactiveIcon, activeIcon: actvIcon, label: title);
}
