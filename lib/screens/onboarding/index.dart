import 'package:flutter/material.dart';
import 'package:flutter_login_signup/providers/color_provider.dart';
import 'package:flutter_login_signup/screens/auth/welcomeScreen.dart';
import 'package:flutter_login_signup/screens/onboarding/components/onboard_page.dart';
import 'package:provider/provider.dart';

import 'data/onboard_page_data.dart';
import 'package:flutter_login_signup/main.dart' as global;

class Onboarding extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    _doneButtonPressed() {
      global.Glo.is_done = false;
      Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
    }
    ColorProvder colorProvder = Provider.of<ColorProvder>(context);
    return Stack(
        children: [
          PageView.builder(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            itemCount: onboardData.length,
            itemBuilder: (context, index) {
              return OnboardPage(
                pageController: pageController,
                pageModel: onboardData[index],
              );
            },
          ),
          Container(
            width: double.infinity,
            height: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      "ConfiDelivery",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                        color: colorProvder.color
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: FlatButton(
                      child: Text(
                          "Skip",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: colorProvder.color
                          ),
                    ),
                      onPressed: _doneButtonPressed,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]
      );
  }
}
