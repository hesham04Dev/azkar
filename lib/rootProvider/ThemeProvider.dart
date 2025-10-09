import 'package:flutter/material.dart';

import '../db/db.dart';
import '/config/colors.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    init();
    // _languageId = db.sql.settings.getLanguageId();
    
  }
  init() async{
     _accentColor = colors[await AppDatabase.db.settingDao.getAccentColorIndex()];
    print("eee accent color: $_accentColor");
    _darkMode = await AppDatabase.db.settingDao.getDarkMode();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
    
  }

  accentColorChanged(var color) {
    _accentColor = color;
    print("eee color changed");
    notifyListeners();
  }

  toggleMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }

  // languageChanged(int langId) {
  //   _languageId = langId;
  //   db.sql.settings.setLanguageId(langId);
  //   Translate.setLang(Translate.supportedLangs[langId]);
  //   notifyListeners();
  // }

   MaterialColor _accentColor =colors[0];
  MaterialColor get  AccentColor => _accentColor;
   bool _darkMode =true;
  bool get DarkMode => _darkMode;
  // late int _languageId;
  // int get LanguageId => _languageId;
  // String get Language => Translate.supportedLangs[_languageId];
  
}
