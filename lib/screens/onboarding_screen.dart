// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_ui_app/component/custom_outline.dart';
import 'package:movies_ui_app/constants.dart';
import 'package:movies_ui_app/screens/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeScreen homeScreen = HomeScreen();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.1,
              left: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.3,
              right: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.07,
                      ),
                      CustomOutline(
                        strokeWidth: 4,
                        radius: screenWidth * 0.8,
                        padding: const EdgeInsets.all(4),
                        width: screenWidth * 0.9,
                        height: screenWidth * 0.9,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Constants.kPinkColor,
                              Constants.kPinkColor.withOpacity(0),
                              Constants.kGreenColor.withOpacity(0.1),
                              Constants.kGreenColor
                            ],
                            stops: const [
                              0.2,
                              0.4,
                              0.6,
                              1
                            ]),
                        child: ClipOval(
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/img-onboarding.png'),
                                alignment: Alignment.bottomLeft,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      Text(
                        'Watch movies in\n Virtual Reality',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenHeight <= 667 ? 18 : 34,
                          fontWeight: FontWeight.bold,
                          color: Constants.kWhiteColor,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Text(
                        '  Download and watch offline \n where ever you are',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenHeight <= 667 ? 12 : 16,
                          color: Constants.kGreyColor,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.06,
                      ),
                      CustomOutline(
                        strokeWidth: 3,
                        radius: 20,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Constants.kPinkColor, Constants.kGreenColor],
                        ),
                        width: 160,
                        height: 40,
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Constants.kPinkColor.withOpacity(0.5),
                                Constants.kGreenColor.withOpacity(0.5)
                              ],
                            ),
                          ),
                          child: Center(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => homeScreen),
                                    );
                                  },
                                  child: const Text(
                                    'Go',
                                    style: TextStyle(
                                      color: Constants.kWhiteColor,
                                    ),
                                  ))),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(3, (index) {
                          ;
                          return Container(
                            height: 7,
                            width: 7,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 0
                                    ? Constants.kGreenColor
                                    : Constants.kWhiteColor.withOpacity(0.2)),
                          );
                        }),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
