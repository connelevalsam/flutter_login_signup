import 'package:flutter/material.dart';
import 'package:flutter_login_signup/providers/color_provider.dart';
import 'package:flutter_login_signup/screens/auth/welcomeScreen.dart';
import 'package:flutter_login_signup/screens/onboarding/models/onboard_page_model.dart';
import 'package:provider/provider.dart';

import '../../../main.dart' as global;
import 'drawer_paint.dart';


class OnboardPage extends StatefulWidget {
  final OnboardPageModel pageModel;
  final PageController pageController;

  const OnboardPage({Key key, this.pageModel, @required this.pageController}) : super(key: key);

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> heroAnimation;
  Animation<double> borderAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));

    heroAnimation = Tween<double>(begin: -40, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    borderAnimation = Tween<double>(begin: 75, end: 50).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));

    animationController.forward(from: 0);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _nextButtonPressed() {
    Provider.of<ColorProvder>(context).color = widget.pageModel.nextAccentColor;
    if(widget.pageController.page == 2.0 ) {
      global.Glo.is_done = true;
    }
    widget.pageController.nextPage(
      duration: Duration(
        milliseconds: 100
      ),
      curve: Curves.fastLinearToSlowEaseIn
    );
  }

  _doneButtonPressed() {
    global.Glo.is_done = false;
    Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: widget.pageModel.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedBuilder(
                animation: heroAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(heroAnimation.value, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Image.asset(widget.pageModel.imagePath),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          widget.pageModel.caption,
                          style: TextStyle(
                              fontSize: 24,
                              color:
                              widget.pageModel.accentColor.withOpacity(0.8),
                              letterSpacing: 1,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          widget.pageModel.subhead,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: widget.pageModel.accentColor,
                              letterSpacing: 1,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          widget.pageModel.description,
                          style: TextStyle(
                            fontSize: 18,
                            color:
                            widget.pageModel.accentColor.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AnimatedBuilder(
            animation: borderAnimation,
            builder: (context, child) {
              return CustomPaint(
                painter: DrawerPaint(
                    curveColor: widget.pageModel.accentColor
                ),
                child: Container(
                  width: borderAnimation.value,
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: nextPage(),
                    ),
                  ),
                ),
              );
            }
          ),
        )
      ]
    );
  }

  IconButton nextPage() {
    if(global.Glo.is_done == false) return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: widget.pageModel.primaryColor,
        size: 32,
      ),
      onPressed: _nextButtonPressed,
    );
    else return IconButton(
      icon: Icon(
        Icons.done_outline_outlined,
        color: widget.pageModel.primaryColor,
        size: 32,
      ),
      onPressed: _doneButtonPressed,
    );
  }
}
