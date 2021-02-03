import 'package:flutter/cupertino.dart';

class OnboardPageModel {
  final Color primaryColor;
  final Color accentColor;
  final Color nextAccentColor;
  final int pageNumber;
  final String imagePath;
  final String caption;
  final String subhead;
  final String description;

  OnboardPageModel(this.primaryColor, this.accentColor, this.nextAccentColor,
      this.pageNumber, this.imagePath, this.caption, this.subhead, this.description);
}