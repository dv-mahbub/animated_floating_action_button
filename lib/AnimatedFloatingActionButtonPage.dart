import 'package:flutter/material.dart';

import 'navigationBody/dashboard_body.dart';
import 'navigationBody/home_body.dart';
import 'navigationBody/profile_body.dart';
import 'navigationBody/settings_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> bodyProperty = [
    const HomeBody(),
    const DashboardBody(),
    const ProfileBody(),
    const SettingsBody()
  ];

  void onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void showScanPopup() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    final left = offset.dx + 100;
    final top = offset.dy + renderBox.size.height;
    final right = left + renderBox.size.width;
    print(top);

    showMenu<int>(
      context: context,
      color: Colors.purple,
      position: RelativeRect.fromLTRB(left, 613, right, 666),
      elevation: 0,
      items: [
        PopupMenuItem<int>(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.star),
              SizedBox(width: 10),
              Text("Get The App"),
            ],
          ),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: Row(
            children: [
              Icon(Icons.chrome_reader_mode),
              SizedBox(width: 10),
              Text("About"),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value == 1) {
        _showDialog(context);
      } else if (value == 2) {
        _showDialog(context);
      }
    });
  }


  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Dialog Title"),
          content: Text("This is a dialog box."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hello'),
            backgroundColor: Colors.green[600],
          ),
          body: bodyProperty[_selectedIndex],
          floatingActionButton: Transform.translate(
            offset: const Offset(0, 20), // Adjust the offset as needed
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              onPressed: showScanPopup,
              backgroundColor: Colors.purple,
              child: Icon(
                Icons.qr_code_scanner,
                color: _selectedIndex == 2 ? Colors.white : Colors.white,
              ),
            ),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            //shape:  ContinuousRectangleBorder(),
            notchMargin: 4,
            child: Container(
              height: 55,
              padding: const EdgeInsets.only(bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => onItemSelected(0),
                      child: SizedBox(
                        height: double.infinity,
                        child: Icon(
                          Icons.home,
                          color: _selectedIndex == 0
                              ? Colors.green[400]
                              : Colors.grey[850],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => onItemSelected(1),
                      child: SizedBox(
                        height: double.infinity,
                        child: Icon(
                          Icons.dashboard,
                          color: _selectedIndex == 1
                              ? Colors.green[400]
                              : Colors.grey[850],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      child: Text(""),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => onItemSelected(2),
                      child: Container(
                        height: double.infinity,
                        child: Icon(
                          Icons.person,
                          color: _selectedIndex == 2
                              ? Colors.green[400]
                              : Colors.grey[850],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => onItemSelected(3),
                      child: Container(
                        height: double.infinity,
                        child: Icon(
                          Icons.settings,
                          color: _selectedIndex == 3
                              ? Colors.green[400]
                              : Colors.grey[850],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
