import 'package:care/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const CustomBottomNavBar(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const CustomBottomNavBar()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
