
import 'package:audio_service/audio_service.dart';
import 'package:new_azkar/handlers/audio_handler.dart';
import 'package:new_azkar/pages/zkrPage/providers/zkr_provider.dart';
import 'package:new_azkar/rootProvider/audio_provider.dart';

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
  // final audioHandler = await AudioService.init(
  //   builder: () => MyAudioHandler(),
  //   config: const AudioServiceConfig(
  //     androidNotificationChannelId: 'com.example.new_azkar.channel.audio',
  //     androidNotificationChannelName: 'Azkar Audio',
  //     androidStopForegroundOnPause: true,
  //   ),
  // );
  AudioProvider.handler = await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.example.app.audio',
      androidNotificationChannelName: 'Audio Playback',
      androidStopForegroundOnPause: false,
    ),
  );
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
          ChangeNotifierProvider(
            create: (context) => ZkrProvider(),
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

