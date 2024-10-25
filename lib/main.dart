// lib/main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/routes/app_pages.dart';

final gameStoreTheme = ThemeData.dark().copyWith(
  primaryColor: const Color.fromARGB(255, 245, 26, 26),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 245, 26, 26),
    elevation: 0,
  ),
  textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
);

void main() {
  // Inisialisasi WidgetsFlutterBinding
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GAMENET",
      theme: gameStoreTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
