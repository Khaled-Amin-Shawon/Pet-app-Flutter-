import 'package:flutter/material.dart';
import 'package:pet_app/Screen/Home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetsProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PetsHomeScreen(),
      ),
    );
  }
}

class PetsProvider with ChangeNotifier {
  // Add state management logic here
}