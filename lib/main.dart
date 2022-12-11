import 'package:bmi/input_page.dart';
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      // themeMode: ThemeMode.dark,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color:   Color(0xFF0d1335)),
scaffoldBackgroundColor:  const Color(0xFF0d1335),
// textTheme: TextTheme(bodyText1:TextStyle(color: Colors.white) ),

primaryColor: Colors.brown
      ),
      home: const InputPage(),
    );
  }
}

