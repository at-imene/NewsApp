import 'package:flutter/material.dart';
import 'package:news_app/Network/NewsList.dart';
import 'package:news_app/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  // await load_data();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: Theme.of(context).copyWith(
            primaryColor: Colors.blue,
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
            )),
        home: const MainScreen(),
      ),
    );
  }
}
