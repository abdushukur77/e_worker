import 'package:e_worker/screens/tab_box/create_screen/create_screen.dart';
import 'package:e_worker/screens/tab_box/home_screen/home_screen.dart';
import 'package:e_worker/screens/tab_box/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/size/size_utils.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  List<Widget> screens = [];
  var currentIndex = 0;

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.add_circle_outline_sharp,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Create',
    'Profile',
  ];

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const CreateScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: screens,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(width * .05),
              height: width * .155,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: width * .02),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      HapticFeedback.lightImpact();
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == currentIndex ? width * .32 : width * .27,
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: index == currentIndex ? width * .12 : 0,
                          width: index == currentIndex ? width * .32 : 0,
                          decoration: BoxDecoration(
                            color: index == currentIndex
                                ? Colors.blueAccent.withOpacity(.2)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == currentIndex ? width * .31 : width * .18,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index == currentIndex ? width * .13 : 0,
                                ),
                                AnimatedOpacity(
                                  opacity: index == currentIndex ? 1 : 0,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: Text(
                                    index == currentIndex ? listOfStrings[index] :'',
                                    style: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index == currentIndex ? width * .03 : 20,
                                ),
                                Icon(
                                  listOfIcons[index],
                                  size: width * .076,
                                  color: index == currentIndex
                                      ? Colors.blueAccent
                                      : Colors.black26,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
