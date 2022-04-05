import 'package:flutter/material.dart';
import 'package:owner_information/view/input_information_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Owner Information',
      home: InputInformationPage(),
      theme: ThemeData(
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
        unselectedWidgetColor: Colors.purple,
      ),
    );
  }
}
