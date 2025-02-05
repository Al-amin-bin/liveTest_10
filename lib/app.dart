import 'package:flutter/material.dart';

import 'homeScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Live Test",
      home: HomeScreen(),
    ) ;
  }
}
