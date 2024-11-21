import 'package:flutter/material.dart';
import 'ui/page_punto.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cálculo de distancia entre dos puntos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PagePunto(),
    );
  }
}
