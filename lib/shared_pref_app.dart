import 'package:flutter/material.dart';
import 'package:task_shared_pref/home_screen.dart';

class SharedPrefApp extends StatelessWidget {
  const SharedPrefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      
    );
  }
}