import 'package:audio_service/audio_service.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import '../handlers/audio_handler.dart';
//
// import '../handlers/audio_handler.dart';
//
// class AudioProvider with ChangeNotifier {
//   // final AudioPlayer _player = AudioPlayer();
//   final List<Map<String, String>> tracks;
//
//   int _index = 0;
//   int _repeatCount = 1;
//   bool _isPlaying = false;
//
//   bool get isPlaying => _isPlaying;
//   int get currentIndex => _index;
//
//   AudioProvider({required this.tracks}) {
//     // _player.onPlayerComplete.listen((_) => _onComplete());
//   }
//
//   Future<void> _play() async {
//     final path = tracks[_index]["path"]!.replaceFirst("assets/", "");
//     try {
//       await rootBundle.load(tracks[_index]["path"]!);
//       await _player.stop();
//       await _player.play(AssetSource(path));
//       _isPlaying = true;
//       notifyListeners();
//     } catch (e) {
//       _next(auto: true);
//     }
//   }
//
//   Future<void> toggle() async {
//     if (_isPlaying) {
//       await _player.pause();
//       _isPlaying = false;
//     } else {
//       await _player.resume();
//       _isPlaying = true;
//     }
//     notifyListeners();
//   }
//
//   Future<void> start() async {
//     await _play();
//   }
//
//   void _onComplete() {
//     final repeat = int.parse(tracks[_index]["repeat"] ?? "1");
//     if (_repeatCount < repeat) {
//       _repeatCount++;
//       _play();
//     } else {
//       _repeatCount = 1;
//       _next(auto: true);
//     }
//   }
//
//   void next() => _next();
//   void prev() => _prev();
//
//   void _next({bool auto = false}) {
//     if (_index < tracks.length - 1) {
//       _index++;
//       _repeatCount = 1;
//       _play();
//     } else if (auto) {
//       stop();
//     }
//   }
//
//   void _prev() {
//     if (_index > 0) {
//       _index--;
//       _repeatCount = 1;
//       _play();
//     }
//   }
//
//   Future<void> stop() async {
//     await _player.stop();
//     _isPlaying = false;
//     notifyListeners();
//   }
//
//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }
// }

// You can keep this provider or use a StatelessWidget/StatefulWidget
// to listen directly to the handler's streams.


class AudioProvider with ChangeNotifier {
  // should be inited in the main
  static late MyAudioHandler  handler;
  var context;

  // int _index = 0;
  // int _repeatCount = 1;
  // bool _isPlaying = false;

  bool get isPlaying => MyAudioHandler.isPlaying;
  int get currentIndex => MyAudioHandler.currentIndex;

  final List<Map<String, String>> tracks;

  AudioProvider({required this.tracks, required this.context}) {
    handler.context = context;
    handler.setPlaylist(tracks);

  }

  prev(){
    handler.skipToPrevious();
  }

  start(){
    handler.play();
    notifyListeners();
  }

  static stop(){
    handler.stop();

  }

  Future<void> toggle() async {

    if (isPlaying) {
      await handler.pause();
    } else {
      await handler.play();
    }
    notifyListeners();
  }

  next(){
    handler.skipToNext();
    notifyListeners();
  }


}

