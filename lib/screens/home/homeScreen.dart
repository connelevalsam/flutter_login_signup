import 'package:flutter/material.dart';
import 'package:flutter_login_signup/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final PageController pageController;

  const HomeScreen({Key key, this.pageController}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    _logout () async {
      final prefs = await SharedPreferences.getInstance();
      Navigator.pop(context, MaterialPageRoute(builder: (_) => MyApp()));
      prefs.remove("is_loaded");
    }
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Center(
              child: Text("Home!"),
            ),
            Container(
              child: RaisedButton(
                child: Text('Logout'),
                onPressed: () {
                  _logout();
                },
              ),
            )
          ],
        )
      ),
    );
  }
}

