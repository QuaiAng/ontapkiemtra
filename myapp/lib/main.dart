import 'package:flutter/material.dart';
import 'package:myapp/country.dart';
import 'package:myapp/detail_screen.dart';
import 'package:myapp/search_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/search',
      routes: {
        '/search': (context) => const SearchScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}
