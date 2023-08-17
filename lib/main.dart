import 'package:flutter/material.dart';

import 'pages/homePage.dart';

void main() {
  //TODO adding the db if still i need to add ranking page

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Amiri",
        scaffoldBackgroundColor: Colors.white,

          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightGreen),

         // primarySwatch: Colors.lightGreen,
          appBarTheme: const AppBarTheme(
            color: Colors.lightGreen,
              //elevation: 0.5 ,
              centerTitle: true,
             /*shape: ContinuousRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(200)
                    ),

              )*/

          ),

      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      )
      ,
    );
  }
}
