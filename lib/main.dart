import 'package:flutter/material.dart';
import 'package:skyair/pages/main_page.dart';
import 'package:skyair/pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkyAir',
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Sansita Swashed',
            fontSize: 36.0,
            color: const Color(0xFF77B6CD),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {'/': (_) => HomePage(), '/main': (_) => MainPage()},
    );
  }
}
