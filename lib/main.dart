import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/model/provider.dart';
import 'package:weather/model/theme.dart';
import 'package:weather/view/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Providerstate())],
      child: Consumer<Providerstate>(builder: (context, value, child) {
        
       return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:value.changetheme ? theme.darkmode : theme.lightmode,
            home: const sample());
      }),
    );
  }
}
