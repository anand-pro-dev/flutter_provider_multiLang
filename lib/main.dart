import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mshora/customer/auth/DashBoardUser/dashBoardUserScreen.dart';
import 'package:mshora/customer/auth/DashBoardUser/textScreen.dart';
import 'package:mshora/customer/auth/login.dart';

import 'package:mshora/customer/auth/splash.dart';
import 'package:mshora/lang/app_langugage_provider.dart';
import 'package:mshora/lang/app_localizations.dart';

import 'package:mshora/provider/BottomNavVisibilityProvider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:mshora/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // Check if the platform is web
    kIsWeb
        ? MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => AppLanguageProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => BottomNavVisibilityProvider(),
              ),
            ],
            child: MyApp(),
          )
        : MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => AppLanguageProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => BottomNavVisibilityProvider(),
              ),
            ],
            child: MyApp(),
          ),
  );

  /// to control with SystemUI appBar ///
  // Set the status bar color to white and icons to black
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Background color of the status bar
    statusBarIconBrightness: Brightness.dark, // Icons color
    statusBarBrightness: Brightness.light, // For iOS status bar
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Fetch locale once app starts
    Future.microtask(() =>
        Provider.of<AppLanguageProvider>(context, listen: false).fetchLocale());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguageProvider>(builder: (context, model, child) {
      log(model.appLocal.toString());
      return MaterialApp(
        title: 'mshora',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LogInScreen(),
        locale: model.appLocal,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ne', 'NP'),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
      );
    });
  }
}
