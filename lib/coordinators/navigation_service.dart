import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._();
  static final NavigationService _instance = NavigationService._();
  static NavigationService get instance => _instance;
  final _navigatorKey = GlobalKey<FormState>();
  GlobalKey<FormState> get navigatorKey => _navigatorKey;

  goBack() {
    Navigator.of(navigatorKey.currentState!.context).pop();
  }
  //TODO:
  //Navigate to Different Pages with different types of animations
}
