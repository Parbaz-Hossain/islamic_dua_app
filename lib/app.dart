import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/themes/app_theme.dart';
import 'core/constants/app_routes.dart';
import 'screens/home/home_screen.dart';
import 'screens/duas/duas_list_screen.dart';
import 'screens/duas/dua_detail_screen.dart';
import 'screens/dhikr/dhikr_counter_screen.dart';
import 'screens/reminders/reminders_screen.dart';
import 'screens/settings/settings_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic Dua App',
      theme: AppTheme.lightTheme,
      
      // Localization support
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('bn', ''), // Bengali
        Locale('ar', ''), // Arabic
      ],
      
      // Routes
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.duas: (context) => const DuasListScreen(),
        AppRoutes.duaDetail: (context) => const DuaDetailScreen(),
        AppRoutes.dhikr: (context) => const DhikrCounterScreen(),
        AppRoutes.reminders: (context) => const RemindersScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
      },
    );
  }
}