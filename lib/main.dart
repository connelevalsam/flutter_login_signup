import 'package:flutter/material.dart';
import 'package:flutter_login_signup/providers/color_provider.dart';
import 'package:flutter_login_signup/screens/auth/welcomeScreen.dart';
import 'package:flutter_login_signup/screens/home/homeScreen.dart';
import 'package:flutter_login_signup/screens/onboarding/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int is_loaded;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  is_loaded = await prefs.getInt("is_loaded");
  await prefs.setInt("is_loaded", 9);
  print('is_loaded ********* $is_loaded ');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _check() {
    if(is_loaded == 0 || is_loaded == null) {
      return "first";
    } else if(is_loaded == 9) {
      return "welcome";
    } else return "/";
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'ConfiDelivery',
      theme: ThemeData(
         primarySwatch: Colors.blue,
         textTheme:GoogleFonts.latoTextTheme(textTheme).copyWith(
           bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
         ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: _check(),
      routes: {
        '/': (context) => HomeScreen(),
        'first': (context) => OnboardingScreen(),
        'welcome': (context) => WelcomePage(),
      },
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
          builder: (context) => ColorProvder(),
          child: Onboarding()
      ),
    );
  }
}

class Glo {
  static var is_done = false;

  static bool flip() {
    is_done = !is_done;
    return is_done;
  }
}

