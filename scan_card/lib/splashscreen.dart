import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scan_card/mainscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox.fromSize(size: const Size.fromHeight(30)),
        const Center(
          child: Image(
            image: AssetImage("images/logoimg.png"),
          ),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Column(
              children: const [
                Text(
                  '© Cash Vs Scrap 2023, All Right Reserves',
                  style: TextStyle(
                    fontFamily: '',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Developed By Nouman Tech.',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ))
      ],
    ));
  }
}
