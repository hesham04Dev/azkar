// import 'package:audio_service/audio_service.dart';
// import 'package:just_audio/just_audio.dart';
//
// class MyAudioHandler extends BaseAudioHandler
//     with QueueHandler, SeekHandler {
//   final _player = AudioPlayer();
//   late List<Map> _tracks;
//   int currentIndex = 0;
//   int _currentRepeatCount = 0;
//
//   MyAudioHandler() {
//     _player.playerStateStream.listen(_broadcastState);
//
//     // Handle track end
//     _player.processingStateStream.listen((state) async {
//       if (state == ProcessingState.completed) {
//         await _handleTrackEnd();
//       }
//     });
//   }
//   Future<void> _handleTrackEnd() async {
//     final track = _tracks[currentIndex];
//     final repeatCount = track["repeat"] ?? 1;
//
//     if (_currentRepeatCount + 1 < repeatCount) {
//       _currentRepeatCount++;
//       await _player.seek(Duration.zero);
//       await play();
//     } else {
//       await skipToNext();
//     }
//   }
//
//   Future<void> setPlaylist(List<Map> tracks) async {
//     _tracks = tracks;
//     List<MediaItem> medias = _tracks.map((audio)=>MediaItem(id: audio["id"] ,title: "azkar",
//     )).toList();
//     queue.add(medias);
//     var duration = await _player.setAudioSources(
//       _tracks.map((audio) => AudioSource.asset(audio["path"])).toList(),
//         );
//     print("tje dur: $duration");
//     mediaItem.add(medias.first);
//   }
// fn(){
//
// }
//   @override
//   Future<void> play() => _player.play();
//
//   @override
//   Future<void> pause() => _player.pause();
//
//   @override
//   Future<void> stop() => _player.stop();
//
//   @override
//   Future<void> skipToNext() => _player.seekToNext();
//
//   @override
//   Future<void> skipToPrevious() => _player.seekToPrevious();
//
//   void _broadcastState(PlayerState state) {
//     final playing = state.playing;
//     final processingState = const {
//       ProcessingState.idle: AudioProcessingState.idle,
//       ProcessingState.loading: AudioProcessingState.loading,
//       ProcessingState.buffering: AudioProcessingState.buffering,
//       ProcessingState.ready: AudioProcessingState.ready,
//       ProcessingState.completed: AudioProcessingState.completed,
//     }[state.processingState]!;
//
//     playbackState.add(playbackState.value.copyWith(
//       controls: [
//         MediaControl.skipToPrevious,
//         playing ? MediaControl.pause : MediaControl.play,
//         MediaControl.stop,
//         MediaControl.skipToNext,
//       ],
//       systemActions: const {
//         MediaAction.seek,
//         MediaAction.seekForward,
//         MediaAction.seekBackward,
//       },
//       androidCompactActionIndices: const [0, 1, 3],
//       processingState: processingState,
//       playing: playing,
//       updatePosition: _player.position,
//       bufferedPosition: _player.bufferedPosition,
//       speed: _player.speed,
//     ));
//   }
// }
import 'package:audio_service/audio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:new_azkar/pages/zkrPage/providers/zkr_provider.dart';
import 'package:provider/provider.dart';

class MyAudioHandler extends BaseAudioHandler
    with QueueHandler, SeekHandler {
  final _player = AudioPlayer();
  List<Map> _tracks = [];
  static int currentIndex = -1;
  static bool isPlaying=false;
  int _currentRepeatCount = 0;
  BuildContext? context;
  MyAudioHandler() {
    _player.playerStateStream.listen(_broadcastState);

    // Handle track end
    _player.processingStateStream.listen((state) async {
      if (state == ProcessingState.completed) {
        await _handleTrackEnd();
      }
    });
  }

  Future<void> setPlaylist(List<Map> tracks) async {
    _tracks = tracks;

    // Create MediaItems for audio_service queue
    final medias = tracks.map((audio) {
      final parts = audio["duration"].split(':').map(int.parse).toList();
      int hours = 0, minutes = 0, seconds = 0;


        hours = parts[0];
        minutes = parts[1];
        seconds = parts[2];
      return MediaItem(
        id: audio["path"],
        title: "Azkar",
        duration: Duration(hours: hours,minutes: minutes,seconds: seconds) ,
        artUri:  Uri.parse('https://hcody.com/storage/projects/01K6FDWET0ANS86A657K3MR7H7.jpg'),
      );
    }).toList();

    queue.add(medias);

    // await _setSource();
  }

  Future<void> setSource() async {
    if(currentIndex == -1) currentIndex = 0;
    if (currentIndex < 0 || currentIndex >= _tracks.length) return;
    final track = _tracks[currentIndex];

    _currentRepeatCount = 0;
    context?.read<ZkrProvider>().setCurrentIndex(currentIndex);
    await _player.setAudioSource(AudioSource.asset(track["path"]));

    mediaItem.add(queue.value[currentIndex]);
  }

  Future<void> _handleTrackEnd() async {
    final track = _tracks[currentIndex];
    final repeatCount = int.parse(track["repeat"]??"1") ;
    context?.read<ZkrProvider>().onZkrRepeat();
    if (_currentRepeatCount + 1 < repeatCount) {
      _currentRepeatCount++;

      await _player.seek(Duration.zero);
      await play();
    } else {

      await skipToNext();
    }
  }

  @override
  Future<void> play() async{
    if(currentIndex ==-1){
      await skipToNext();
    }
    _player.play();
    isPlaying = true;
  }

  @override
  Future<void> pause()async {
    _player.pause();
    isPlaying=false;
  }

  @override
  Future<void> stop() async{
    currentIndex =-1;
    _player.stop();
    isPlaying=false;
  }

  @override
  Future<void> skipToNext() async {
    if (currentIndex + 1 < _tracks.length) {
      currentIndex++;
      await setSource();
      await play();
    } else {
      // End of playlist
      await stop();
    }
  }

  @override
  Future<void> skipToPrevious() async {
    if (currentIndex - 1 >= 0) {
      currentIndex--;
      await setSource();
      await play();
    }
  }

  void _broadcastState(PlayerState state) {
    final playing = state.playing;
    final processingState = const {
      ProcessingState.idle: AudioProcessingState.idle,
      ProcessingState.loading: AudioProcessingState.loading,
      ProcessingState.buffering: AudioProcessingState.buffering,
      ProcessingState.ready: AudioProcessingState.ready,
      ProcessingState.completed: AudioProcessingState.completed,
    }[state.processingState]!;

    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          playing ? MediaControl.pause : MediaControl.play,
          // MediaControl.stop,
          MediaControl.skipToNext,
        ],
        androidCompactActionIndices: const [0, 1, 3],
        processingState: processingState,
        playing: playing,
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        speed: _player.speed,
      ),
    );
  }
}
