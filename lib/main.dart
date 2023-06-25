import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool showWidgets = false;
  bool _isMenuShowed = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _toggleAnimation() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        showWidgets = true;
      });
    });
    setState(() {
      if (showWidgets) {
        showWidgets = false;
      }
      _isMenuShowed = !_isMenuShowed;
      if (_isMenuShowed) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated Floating Action Bar"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            "PLAN TAKE",
            style: TextStyle(fontSize: 20),
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "")
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
        AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: _isMenuShowed ? 200.0 : 0.0,
        height: _isMenuShowed ? 200.0 : 0.0,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
    child: Column(
    .
