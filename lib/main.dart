import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'providers/theme_provider.dart';
import 'providers/app_theme.dart';
import 'screens/splash_screen.dart';
// لو هتستخدمي StartPage بدل Splash
// import 'package:task7/strat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 🔥 Firebase init
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCWt0MDDM0t-40eAuTznvVdV293NiuBZoM",
      authDomain: "task7nti.firebaseapp.com",
      projectId: "task7nti",
      storageBucket: "task7nti.appspot.com",
      messagingSenderId: "496132144436",
      appId: "1:496132144436:web:d2af4adda214ec25513961",
      measurementId: "G-DVG1R4LWZ8",
    ),
  );

  /// 🌍 Localization delegate
  final delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: ['en', 'ar'],
  );

  runApp(
    LocalizedApp(
      delegate,
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final delegate = LocalizedApp.of(context).delegate;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trendify',

      /// 🌍 Localization
      locale: delegate.currentLocale,
      supportedLocales: delegate.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      /// 🎨 Theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,

      /// 🏠 Start Screen
      home: const SplashScreen(),
      // لو عايزة StartPage:
      // home: const StartPage(),
    );
  }
}
