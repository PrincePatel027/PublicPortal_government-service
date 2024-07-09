import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? time;
  @override
  void initState() {
    super.initState();
    time = Timer.periodic(
      const Duration(seconds: 3),
      (_) {
        Navigator.pushReplacementNamed(context, '/');
      },
    );
  }

  @override
  void dispose() {
    time!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 5,
            child: Image.asset('assets/images/splash_bg.png'),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          const Text(
            'PublicPortal',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            textAlign: TextAlign.center,
            "Access Government Information with Ease",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
