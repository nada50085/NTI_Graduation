import 'package:flutter/material.dart';

class AppTheme {
  /// ================= LIGHT THEME =================
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 110, 48, 246),
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 110, 48, 246),
      foregroundColor: Colors.white,
      centerTitle: true,
    ),

    cardColor: const Color(0xFFE7E6F6), // ✅ لون الكاردات البنفسجي الفاتح

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white, // لون السيرش بار
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIconColor: Colors.grey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black87),
      titleMedium: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
    ),

    dividerColor: Colors.black12,
  );

  /// ================= DARK THEME =================
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 110, 48, 246),
    scaffoldBackgroundColor: const Color(0xFF121212),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 71, 41, 244),
      foregroundColor: Colors.white,
      centerTitle: true,
    ),

    cardColor: const Color(0xFF2A2650), // ✅ البنفسجي الغامق للدارك

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1E1E1E), // لون السيرش بار
      hintStyle: const TextStyle(color: Colors.white54),
      prefixIconColor: Colors.white70,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white70),
      titleMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
    ),

    dividerColor: Colors.white12,
  );
}
