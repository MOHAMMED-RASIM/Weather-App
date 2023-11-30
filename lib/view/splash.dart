import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather/view/homepage.dart';
import 'package:weather/viewmodel/geolocator.dart';

class sample extends StatefulWidget {
  const sample({super.key});

  @override
  State<sample> createState() => _sampleState();
}

class _sampleState extends State<sample> {
  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        logo: Image.network(
            'https://cdn-icons-png.flaticon.com/512/3767/3767036.png'),
        title: const Text(
          "WEATHER",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey.shade400,
        showLoader: true,
        loadingText: const Text("Loading..."),
        navigator: Homepage(),
        durationInSeconds: 5,
      ),
    );
  }
}
