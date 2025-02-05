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
  AppLanguageProvider appLanguage = AppLanguageProvider();
  await appLanguage.fetchLocale();

  runApp(
    // Check if the platform is web
    kIsWeb
        ? DevicePreview(
            enabled: true, // Enable Device Preview only for Web
            tools: const [
              ...DevicePreview.defaultTools,
            ],
            builder: (context) => MyApp(
              appLanguage: appLanguage,
            ),
          )
        : MyApp(
            appLanguage: appLanguage,
          ), // Directly use MyApp for other platforms
  );

  /// to control with SystemUI appBar ///
  // Set the status bar color to white and icons to black
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Background color of the status bar
    statusBarIconBrightness: Brightness.dark, // Icons color
    statusBarBrightness: Brightness.light, // For iOS status bar
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguageProvider? appLanguage;
  const MyApp({super.key, required this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppLanguageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavVisibilityProvider(),
        ),
      ],
      child: Consumer<AppLanguageProvider>(builder: (context, model, child) {
        return MaterialApp(
          title: 'Localization Demo',
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
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
        );
      }),

      // child: MaterialApp(
      //   debugShowCheckedModeBanner: false,

      //   // Use DevicePreview only if the app is running on the web
      //   locale: kIsWeb ? DevicePreview.locale(context) : null,
      //   builder: kIsWeb ? DevicePreview.appBuilder : null,

      //   title: 'mshora',
      //   theme: ThemeData(
      //     scaffoldBackgroundColor: AppColors.bgSecondayLight,
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //     textTheme: GoogleFonts.ptSansTextTheme(
      //       Theme.of(context).textTheme,
      //     ),
      //   ).copyWith(
      //     pageTransitionsTheme: const PageTransitionsTheme(
      //       builders: <TargetPlatform, PageTransitionsBuilder>{
      //         TargetPlatform.android: ZoomPageTransitionsBuilder(),
      //       },
      //     ),
      //   ),

      //   // Set the appropriate home screen
      //   // home: LogInScreen(),
      //   // home: TestScreen(),
      //   home: SplashScreen(),
      //   // home: ShowCurrentDevice(),
      //   // home: OnBoadingStart(),
      //   // home: ProgressionIndicator(),
      //   // home: OnBoadingSecond(),
      //   // home: HideBottomToScroll(),
      //   // home: ProfileScreen(),
      //   // home: const DashBoardUserScreen(),
      //   // home: const DashBoadServiceProvider(),
      // ),
    );
  }
}
