import 'package:flutter/material.dart';
import 'package:yemekuygulamasi/yemek_detay.dart';
import 'package:yemekuygulamasi/yemekler_listesi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: YemeklerSayfasi()
    );
  }
}
