import 'package:flutter/material.dart';
import 'package:jibika_flex_task/pages/main_screem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JIBIKA PLEXUS',
      theme: ThemeData( appBarTheme: const AppBarTheme(backgroundColor: Color(0xff267862),centerTitle: true),
        scaffoldBackgroundColor: const Color(0xfff1f3ef),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff267862)),
        useMaterial3: false,
      ),
      home: const MainScreen(),
    );
  }
}
