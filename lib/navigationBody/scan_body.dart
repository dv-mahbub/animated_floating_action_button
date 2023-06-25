import 'package:flutter/material.dart';

class ScanBody extends StatefulWidget {
  const ScanBody({Key? key}) : super(key: key);

  @override
  State<ScanBody> createState() => _ScanBodyState();
}

class _ScanBodyState extends State<ScanBody> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Icon(Icons.qr_code_scanner),);
  }
}
