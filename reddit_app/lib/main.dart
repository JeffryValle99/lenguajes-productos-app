import 'package:flutter/material.dart';
import 'package:reddit_app/src/router/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Reddit App',
      routerConfig: router,
      // home: HomePage(),
    );
  }
}
