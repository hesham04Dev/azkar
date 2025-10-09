
import '/pages/homePage/Bodies/providers/pageIndexProvider.dart';
import 'package:flutter/material.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'pages/homePage/homePage.dart';
import 'rootProvider/settings_controller.dart';
import 'config/app_theme.dart';
import 'db/db.dart';
import 'rootProvider/ThemeProvider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.init();
  SettingsController.appVersion = (await PackageInfo.fromPlatform()).version;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PageIndexProvider(),
          ),
          
        ],
        child: Builder(builder: (context) {
          bool isDarkMode = context.watch<ThemeProvider>().DarkMode;
          Color accentColor = context.watch<ThemeProvider>().AccentColor;
          return MaterialApp(
              locale: Locale("ar"),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales:
                [Locale("ar")],
            title: 'Achievement Box',
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            theme: buildTheme(context,accentColor, isDarkMode),
            home: HomePage(title: "الأذكار"),
          );
        }));
  }
}

