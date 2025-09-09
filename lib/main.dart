import 'package:flutter/material.dart';
import 'appbar.dart'; // panggil file appbar.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zutto UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AppBarPage(), 
    );
  }
}
class ProfileKelompok extends StatelessWidget {
  const ProfileKelompok({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
