import 'dart:developer';

import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'appName',
      home: const BottomNavigatorExample(title: 'appName'),
    );
  }
}

class BottomNavigatorExample extends StatefulWidget {
  const BottomNavigatorExample({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<BottomNavigatorExample> createState() => _BottomNavigatorExampleState();
}

class _BottomNavigatorExampleState extends State<BottomNavigatorExample> {
  bool circleButtonToggle = false;
  List<Color> listOfColor = [
    const Color(0xFFF2B5BA),
    Colors.orange,
    Colors.amber,
    Colors.deepOrangeAccent
  ];
  int index = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 3,
              backgroundColor: AppColors.cherryRed,
              title: Text(widget.title),
            ),
            backgroundColor: listOfColor[index],
            floatingActionButton: const SizedBox(
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              barColor: Colors.white,
              controller: FloatingBottomBarController(initialIndex: 1),
              bottomBar: [
                BottomBarItem(
                  icon: const Icon(Icons.home, ),
                  iconSelected: const Icon(Icons.home,
                      color: AppColors.cherryRed,
                      ),
                  title: 'home',
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                    log('Home $value');
                  },
                ),
                BottomBarItem(
                  icon:
                  const Icon(Icons.photo, ),
                  iconSelected: const Icon(Icons.photo,
                      color: AppColors.cherryRed,
                      ),
                  title: 'search',
                  dotColor: AppColors.cherryRed,
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                    log('Search $value');
                  },
                ),
                BottomBarItem(
                  icon:
                  const Icon(Icons.person, ),
                  iconSelected: const Icon(Icons.person,
                      color: AppColors.cherryRed,
                      ),
                  title: 'person',
                  dotColor: AppColors.cherryRed,
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                    log('Profile $value');
                  },
                ),
                BottomBarItem(
                  icon: const Icon(Icons.settings,
                      ),
                  iconSelected: const Icon(Icons.settings,
                      color: AppColors.cherryRed,
                      ),
                  title: 'settings',
                  dotColor: AppColors.cherryRed,
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                    log('Settings $value');
                  },
                ),
              ],
              bottomBarCenterModel: BottomBarCenterModel(
                centerBackgroundColor: AppColors.cherryRed,
                centerIcon: const FloatingCenterButton(
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                ),
                centerIconChild: [
                  FloatingCenterButtonChild(
                    child: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: AppColors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Home',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ],
                    ),
                    onTap: () => log('Item1'),
                  ),
                  FloatingCenterButtonChild(
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_alarm,
                          color: AppColors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Alarm',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ],
                    ),
                    onTap: () => log('Item2'),
                  ),
                  FloatingCenterButtonChild(
                    child: Row(
                      children: [
                        Icon(
                          Icons.ac_unit_outlined,
                          color: AppColors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'AC Unit',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ],
                    ),
                    onTap: () => log('Item3'),
                  ),
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
}