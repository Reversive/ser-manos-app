import 'package:flutter/material.dart';
import 'package:ser_manos/src/core/navigator_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Scaffold(
        body: const NavigatorPage(),
      ),
    );
  }
}
