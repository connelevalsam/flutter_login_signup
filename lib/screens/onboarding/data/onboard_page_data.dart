import 'package:flutter/material.dart';
import 'package:flutter_login_signup/screens/onboarding/models/onboard_page_model.dart';

List<OnboardPageModel> onboardData = [
  OnboardPageModel(
      Color(0xFFE6E6E6),
      Color(0xFF005699),
      Color(0xFFFFE074),
      2,
      'assets/images/img1.jpg',
      'FAST AND RELIABLE',
      'FOOD STUFF',
      'We deliver just-in-time and our services are reliable!'
  ),
  OnboardPageModel(
    Color(0xFF005699),
    Color(0xFFFFE074),
    Color(0xFF39393A),
    2,
    'assets/images/img2.jpg',
    'POCKET FRIENDLY',
    'ACCESSORIES',
    'No hidden charges and extra fees required!',
  ),
  OnboardPageModel(
    Color(0xFFFFE074),
    Color(0xFF39393A),
    Color(0xFFE6E6E6),
    0,
    'assets/images/img3.jpg',
    'SECURITY',
    'MOVERS',
    'We make sure your orders are safe and secure.',
  ),
  OnboardPageModel(
    Color(0xFF39393A),
    Color(0xFFE6E6E6),
    Color(0xFF005699),
    1,
    'assets/images/img4.png',
    'ACCOUNTABILITY',
    '24/7 CUSTOMER CARE',
    'In case of any emergency, we are always available!',
  ),
];