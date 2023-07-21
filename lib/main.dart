import 'package:abs_task3/screens/pet_market_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'BalsamiqSans',
          primarySwatch: Colors.orange,
      ),
      home:PetMarketScreen() ,
    );
  }
}