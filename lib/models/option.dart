import 'package:flutter/cupertino.dart';

class Option {
  String text;
  Color color;
  IconData icon;
  VoidCallback   onPressed;

  Option({required this.text, required this.color, required this.icon,   required this.onPressed});
}

class Images{
  String text;
  String assetImage;

  Images({required this.text, required this.assetImage });
}