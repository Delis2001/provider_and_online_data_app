 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_and_online_data_app/providers/post_provider.dart';
import 'package:provider_and_online_data_app/providers/user_provider.dart';
import 'package:provider_and_online_data_app/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> PostProvider()),
      ChangeNotifierProvider(create: (context)=> UserProvider())
    ],
      child: const MaterialApp(
        home: Scaffold(
          body: HomeScreen(),
        ),
      ),
    );
  }
}
