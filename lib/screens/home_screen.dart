import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:movies_ui_app/component/masked_image.dart';

import 'package:movies_ui_app/component/search_filed.dart';
import 'package:movies_ui_app/constants.dart';
import 'package:movies_ui_app/models/movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: -83,
              left: -111,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor.withOpacity(0.5),
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
              top: screenHeight * 0.4,
              right: -88,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor.withOpacity(0.5),
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
            Positioned(
              bottom: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor.withOpacity(0.5),
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'What would you \n like to watch?',
                      style: TextStyle(
                          color: Constants.kWhiteColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchBoxField(
                    borderRadius: 10.0,
                    backgroundColor: Constants.kGreyColor.withOpacity(0.12),
                    expandable: true,
                    textColor: Constants.kWhiteColor.withOpacity(0.6),
                    onChanged: (value) {
                      // Perform search logic here
                      // You can update the UI or filter data based on the search query
                    },
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.only(right: 180),
                    child: Text(
                      'popular Movies',
                      style: TextStyle(
                        color: Constants.kWhiteColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: newMovies.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = Constants.kMaskFirstIndex;
                          } else if (index == newMovies.length - 1) {
                            mask = Constants.kMaskLastIndex;
                          } else {
                            mask = Constants.kMaskCenter;
                          }
                          return GestureDetector(
                              child: Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 0,
                            ),
                            height: 160,
                            width: 142,
                            child: MaskedImage(
                              asset: newMovies[index].moviePoster,
                              mask: mask,
                            ),
                          ));
                        }),
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.only(right: 170),
                    child: Text(
                      'Upcoming Movies',
                      style: TextStyle(
                        color: Constants.kWhiteColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingMovies.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = Constants.kMaskFirstIndex;
                          } else if (index == newMovies.length - 1) {
                            mask = Constants.kMaskLastIndex;
                          } else {
                            mask = Constants.kMaskCenter;
                          }
                          return GestureDetector(
                              child: Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 0,
                            ),
                            height: 160,
                            width: 142,
                            child: MaskedImage(
                              asset: upcomingMovies[index].moviePoster,
                              mask: mask,
                            ),
                          ));
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Constants.kPinkColor.withOpacity(0.2),
              Constants.kGreenColor.withOpacity(0.2)
            ],
          ),
        ),
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor,
                Constants.kGreenColor,
              ],
            ),
          ),
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: const Color(0xff404c57),
            child: SvgPicture.asset(Constants.kIconPlus),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
        width: screenWidth,
        height: 92,
        borderRadius: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kWhiteColor.withOpacity(0.1),
            Constants.kWhiteColor.withOpacity(0.1),
          ],
        ),
        border: 0,
        blur: 30,
        borderGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kPinkColor,
            Constants.kGreenColor,
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          notchMargin: 4,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Constants.kIconHome,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Constants.kIconPlayOnTv,
                  ),
                ),
              ),
              const Expanded(
                child: Text(''),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Constants.kIconCategories,
                  ),
                ),
              ),
              Expanded(
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Constants.kIconDownload,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
