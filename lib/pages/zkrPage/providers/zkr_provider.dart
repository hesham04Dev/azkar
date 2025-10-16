import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_azkar/handlers/audio_handler.dart';

import '../../../db/db.dart';

class ZkrProvider with ChangeNotifier {
  init(zkrCategoryId) async {
    _azkars = await AppDatabase.db.azkarDao.getAzkarByCategoryId(zkrCategoryId);
    await getTracks();
    notifyListeners();
  }

  // getTracks() async {
  //   List avilabel_soundes = jsonDecode(
  //     await rootBundle.loadString('assets/audio/affasy/names.json'),
  //   );
  //   for (var zkr in _azkars) {
  //     if (avilabel_soundes.contains(zkr["name"])) {
  //       tracks.add({
  //         "id": zkr["id"].toString(),
  //         "path": "assets/audio/affasy/${zkr["name"]}.mp3",
  //         "repeat": "${zkr["repeat"]}",
  //       });
  //     }
  //   }
  // }

  Future<void> getTracks() async {
    // Load duration JSON
    final durations = jsonDecode(
      await rootBundle.loadString('assets/audio/affasy/durations.json'),
    ) as Map<String, dynamic>;

    final availableSounds = durations.keys.toSet();

    tracks.clear(); // optional: clear old list

    for (var zkr in _azkars) {
      final name = zkr["name"];
      if (availableSounds.contains(name)) {
        tracks.add({
          "id": zkr["id"].toString(),
          "path": "assets/audio/affasy/$name.mp3",
          "repeat": zkr["repeat"].toString(),
          "duration": durations[name],
        });
      }
    }
  }

  setZkrHeight(int index, double height) {
    _azkars[index]["height"] = height;
  }

  onZkrRepeat({int? index,bool notify = true}) {
    _azkars[index ?? currentIndex]["repeat"]--;
    if(notify) notifyListeners();
  }

  double getHeightToCurrentIndex() {
    double height = 0;
    for (int i=0;i<currentIndex;i++) {
      var zkr = _azkars[i];
      height += zkr["height"] ?? 0;
    }
    return height;
  }

  scrollToCurrentIndex(){
    _azkarsScroll.animateTo(
      getHeightToCurrentIndex(), // approximate height per item
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  setCurrentIndex(int index) {
    // _currentIndex = index;
    scrollToCurrentIndex();
    print("scrolled");
    notifyListeners();
  }


  List<Map<String,dynamic>> _azkars = [];
  List<Map<String,dynamic>> get azkars => _azkars;

  List<Map<String, String>> _tracks = [];
  List<Map<String, String>> get tracks => _tracks;

  // int _currentIndex = -1;
  int get currentIndex => MyAudioHandler.currentIndex;

  final ScrollController _azkarsScroll= ScrollController();
  ScrollController get azkarsScroll => _azkarsScroll;

}
