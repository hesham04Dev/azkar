import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/rootProvider/audio_provider.dart';
import 'package:new_azkar/models/PrimaryContainer.dart';

class ExpandingAudioButton extends StatefulWidget {
  const ExpandingAudioButton({super.key});

  @override
  State<ExpandingAudioButton> createState() => _ExpandingAudioButtonState();
}

class _ExpandingAudioButtonState extends State<ExpandingAudioButton>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenWidth = MediaQuery.sizeOf(context).width;
    _widthAnimation = Tween<double>(begin: 56, end: screenWidth - 35)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void toggleExpand(AudioProvider audio) {
    setState(() {
      audio.toggle();
      isExpanded = !isExpanded;
      if (isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final audio = context.watch<AudioProvider>();

    return AnimatedBuilder(
      animation: _widthAnimation,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16, right: 16),
          child: PrimaryContainer(
            opacity: 0.5,
            margin: 0,
            padding: 0,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => toggleExpand(audio),
              child: SizedBox(
                height: 56,
                width: _widthAnimation.value,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: isExpanded && _controller.isCompleted
                        ? [
                      IconButton(
                        icon: const Icon(Icons.skip_previous, color: Colors.white, size: 30),
                        onPressed: audio.prev,
                      ),
                      IconButton(
                        icon: Icon(
                          // audio.isPlaying ? Icons.pause : Icons.play_arrow,
                          Icons.pause,
                          color: Colors.white,
                          size: 35,
                        ),
                        onPressed: (){
                          toggleExpand(audio);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next, color: Colors.white, size: 30),
                        onPressed: audio.next,
                      ),
                    ]
                        : const [
                      Icon(Icons.play_arrow, color: Colors.white, size: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/services.dart';
// import 'package:new_azkar/models/PrimaryContainer.dart';
// import 'package:new_azkar/pages/zkrPage/providers/zkr_provider.dart';
// import 'package:provider/provider.dart';
//
// class ExpandingAudioButton extends StatefulWidget {
//   const ExpandingAudioButton({super.key,});
//
//   @override
//   State<ExpandingAudioButton> createState() => _ExpandingAudioButtonState();
// }
//
// class _ExpandingAudioButtonState extends State<ExpandingAudioButton>
//     with SingleTickerProviderStateMixin {
//   bool isExpanded = false;
//   bool isPlaying = false;
//   bool inited =false;
//   late final List<Map<String, String>> tracks;
//
//   late AnimationController _controller;
//   late Animation<double> _widthAnimation;
//
//   final AudioPlayer _player = AudioPlayer();
//   int _audioIndex = 0;
//   int _indexRepetition = 1;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//
//     // When audio finishes, go to next
//
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final screenWidth = MediaQuery.sizeOf(context).width;
//
//     _widthAnimation = Tween<double>(
//       begin: 56,
//       end: screenWidth - 35,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//   }
//
//   Future<void> _playAudio(BuildContext context) async {
//     context.read<ZkrProvider>().setCurrentIndex(_audioIndex);
//     final audio = tracks[_audioIndex];
//     final path = audio["path"]!.replaceFirst("assets/", "");
//     try {
//       // print("tryyyyyyyyyyy");
//       await rootBundle.load(audio["path"] ?? "");
//       print("audio path is: ${audio["path"]}");
//       await _player.stop();
//       await _player.play(AssetSource(path));
//
//       setState(() {
//         isPlaying = true;
//       });
//     } catch (e) {
//       // print("dNNNNNNNNNN");
//       _skipNext(auto: true,context: context);
//     }
//   }
//
//   void _togglePlayPause() {
//     if (isPlaying) {
//       _player.pause();
//       setState(() => isPlaying = false);
//     } else {
//       _player.resume();
//       setState(() => isPlaying = true);
//     }
//   }
//
//   void _skipNext({bool auto = false,required BuildContext context}) {
//     if (_audioIndex < tracks.length - 1) {
//       _audioIndex++;
//       _indexRepetition = 1;
//       _playAudio(context);
//     } else if (auto) {
//       // stop at end of list
//       _indexRepetition = 1;
//       _audioIndex = 0;
//       toggleExpand(context);
//       setState(() => isPlaying = false);
//     }
//   }
//
//   void _onAudioComplete({required int repeat,required BuildContext context}) {
//     context.read<ZkrProvider>().onZkrRepeat();
//     if (_indexRepetition < repeat) {
//       _indexRepetition++;
//       _playAudio(context);
//     } else {
//       _indexRepetition = 1;
//       _skipNext(auto: true,context: context);
//     }
//   }
//
//   void _skipPrevious({required BuildContext context}) {
//     if (_audioIndex > 0) {
//       _indexRepetition = 1;
//       _audioIndex--;
//
//       _playAudio(context);
//     }
//   }
//
//   void toggleExpand(context) {
//     setState(() {
//       isExpanded = !isExpanded;
//       if (isExpanded) {
//         _controller.forward();
//         // auto start playing current track
//         if (!isPlaying) {
//           _playAudio(context);
//         }
//       } else {
//         _controller.reverse();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _player.dispose();
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if(!inited){
//     tracks = context.read<ZkrProvider>().tracks;
//     print(tracks.length);
//     print("dddsss");
//     _player.onPlayerComplete.listen((_) {
//       _onAudioComplete(
//         repeat: int.parse(tracks[_audioIndex]["repeat"] ?? "1"),
//         context: context
//       );
//       // _skipNext(auto: true,);
//     });
//     inited =true;
//     }
//     return AnimatedBuilder(
//       animation: _widthAnimation,
//       builder: (context, child) {
//         return Container(
//           margin: const EdgeInsets.only(bottom: 16, right: 16),
//           child: PrimaryContainer(
//             opacity: 0.5,
//             margin: 0,
//             padding: 0,
//             child: InkWell(
//               borderRadius: BorderRadius.circular(30),
//               onTap: (){
//                 toggleExpand(context);
//               },
//               child: SizedBox(
//                 height: 56,
//                 width: _widthAnimation.value,
//                 child: Directionality(
//                   textDirection: TextDirection.ltr,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: isExpanded && _controller.isCompleted
//                         ? [
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.skip_previous,
//                                 size: 30,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () {_skipPrevious(context:context);},
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 isPlaying ? Icons.pause : Icons.play_arrow,
//                                 size: 35,
//                                 color: Colors.white,
//                               ),
//                               onPressed: _togglePlayPause,
//                             ),
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.skip_next,
//                                 size: 30,
//                                 color: Colors.white,
//                               ),
//                               onPressed: (){_skipNext(context:context);},
//                             ),
//                           ]
//                         : const [
//                             Icon(
//                               Icons.play_arrow,
//                               size: 30,
//                               color: Colors.white,
//                             ),
//                           ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }


//
// // Note: You must add 'just_audio' to your pubspec.yaml dependencies.
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:flutter/services.dart';
// import 'package:new_azkar/models/PrimaryContainer.dart';
//
// // class ExpandingAudioButton extends StatefulWidget {
// //   final List<Map<String, String>> tracks;
// //   // 5 & 6 - Callbacks for state updates
// //   final void Function(String zkrIndex) onZkrCompleted;
// //   final void Function(String zkrIndex) onZkrTrackChanged;
// //
// //   const ExpandingAudioButton({
// //     super.key,
// //     required this.tracks,
// //     required this.onZkrCompleted,
// //     required this.onZkrTrackChanged,
// //   });
// //
// //   @override
// //   State<ExpandingAudioButton> createState() => _ExpandingAudioButtonState();
// // }
// //
// // class _ExpandingAudioButtonState extends State<ExpandingAudioButton>
// //     with SingleTickerProviderStateMixin {
// //
// //   bool isExpanded = false;
// //   // 1 - Use just_audio
// //   final AudioPlayer _player = AudioPlayer();
// //
// //   late AnimationController _controller;
// //   late Animation<double> _widthAnimation;
// //
// //   // Tracks the current index in the just_audio playlist/queue
// //   int _currentPlaylistIndex = -1;
// //   // Tracks the index of the last track in the just_audio playlist/queue
// //   int _lastPlaylistIndex = -1;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 300),
// //     );
// //
// //     // Stream listeners for just_audio
// //     // 5 - Listen to the current index in the playlist
// //     _player.currentIndexStream.listen((index) {
// //       if (index != null && index < widget.tracks.length) {
// //         _currentPlaylistIndex = index;
// //         final currentZkrIndex = (_getFullPlaylist()[index] as AudioSource). as String;
// //         widget.onZkrTrackChanged(currentZkrIndex);
// //         setState(() {}); // For internal widget updates (e.g. skip button state)
// //       }
// //     });
// //
// //     // 6 - Listen to player state changes to detect the end of a full Azkar's repetition cycle
// //     _player.playerStateStream.listen((state) {
// //       if (state.processingState == ProcessingState.completed) {
// //         if (_currentPlaylistIndex < _getFullPlaylist().length) {
// //           final completedZkrIndex = _getFullPlaylist()[_currentPlaylistIndex].tag as String;
// //           // The repeat count is only decreased when a full cycle of an Azkar's repetition is done.
// //           // In this implementation, the Azkar is added 'repeat' times as a single item in the playlist.
// //           // Therefore, the "completion" of the track means its single-play is done, and the playlist handles the next track.
// //           // The repeat number is decreased in ZkrPage *after* the whole track (including its repetitions) is finished and the player moves to the next track.
// //           // Since we rebuild the playlist in ZkrPage, the index changes.
// //           // The logic here will be simplified by just updating state when playback stops.
// //         }
// //
// //         // Handle player stopping when the queue is complete
// //         if (_currentPlaylistIndex == _lastPlaylistIndex && state.processingState == ProcessingState.completed) {
// //           toggleExpand(stop: true);
// //           widget.onZkrTrackChanged("-1"); // Indicate no zkr is playing
// //         }
// //       }
// //     });
// //
// //     // Initial load
// //     _loadPlaylist();
// //   }
// //
// //   @override
// //   void didUpdateWidget(covariant ExpandingAudioButton oldWidget) {
// //     super.didUpdateWidget(oldWidget);
// //     // Reload the playlist if tracks change (e.g., repeat count decreased)
// //     if (widget.tracks != oldWidget.tracks) {
// //       _loadPlaylist();
// //     }
// //   }
// //
// //   // 2 - Use ConcatenatingAudioSource to create a dynamic playlist for 'just_audio'
// //   List<AudioSource> _getFullPlaylist() {
// //     final playlist = <AudioSource>[];
// //     for (final track in widget.tracks) {
// //       final repeatCount = int.tryParse(track["repeat"] ?? "1") ?? 1;
// //       final zkrIndex = track["zkrIndex"] ?? "-1";
// //
// //       // Add the track 'repeatCount' times to the playlist
// //       // The tag is used to pass the original zkr index back to the parent widget
// //       for (int i = 0; i < repeatCount; i++) {
// //         playlist.add(
// //           AudioSource.asset(
// //             track["path"]!.replaceFirst("assets/", ""),
// //             tag: zkrIndex,
// //           ),
// //         );
// //       }
// //     }
// //     _lastPlaylistIndex = playlist.isEmpty ? -1 : playlist.length - 1;
// //     return playlist;
// //   }
// //
// //   Future<void> _loadPlaylist() async {
// //     final playlist = _getFullPlaylist();
// //     if (playlist.isEmpty) {
// //       // Handle empty playlist, e.g., stop the player
// //       await _player.stop();
// //       if(mounted) setState(() {
// //         _currentPlaylistIndex = -1;
// //       });
// //       return;
// //     }
// //
// //     try {
// //       await _player.setAudioSource(
// //         ConcatenatingAudioSource(children: playlist),
// //         initialIndex: 0,
// //         initialPosition: Duration.zero,
// //       );
// //       // The `ConcatenatingAudioSource` handles the playlist and gaps are seamless.
// //       // This is the "more powerfull way to get the filled voices".
// //       _player.setLoopMode(LoopMode.off);
// //     } catch (e) {
// //       // print("Error loading audio source: $e");
// //     }
// //   }
// //
// //   Future<void> _play() async {
// //     if (_player.processingState == ProcessingState.ready || _player.processingState == ProcessingState.completed) {
// //       // If completed, reset to start of playlist
// //       if (_player.processingState == ProcessingState.completed) {
// //         await _player.seek(Duration.zero, index: 0);
// //       }
// //       _player.play();
// //     } else {
// //       _player.play();
// //     }
// //     setState(() {});
// //   }
// //
// //   void _togglePlayPause() {
// //     if (_player.playing) {
// //       _player.pause();
// //     } else {
// //       _play();
// //     }
// //     setState(() {});
// //   }
// //
// //   // 3 - Skip to next: check for last voice
// //   void _skipNext() {
// //     if (_player.hasNext) {
// //       _player.seekToNext();
// //       // Manually trigger the completion callback for the item that was skipped
// //       // The tag should still be available from the previous current index
// //       final previousIndex = _currentPlaylistIndex;
// //       if (previousIndex >= 0 && previousIndex < _getFullPlaylist().length) {
// //         final completedZkrIndex = _getFullPlaylist()[previousIndex].tag as String;
// //         widget.onZkrCompleted(completedZkrIndex);
// //       }
// //     }
// //   }
// //
// //   void _skipPrevious() {
// //     if (_player.hasPrevious) {
// //       _player.seekToPrevious();
// //     } else {
// //       // If at the start, stop and collapse
// //       _player.stop();
// //       toggleExpand(stop: true);
// //     }
// //   }
// //
// //   void toggleExpand({bool stop = false}) {
// //     setState(() {
// //       isExpanded = stop ? false : !isExpanded;
// //       if (isExpanded) {
// //         _controller.forward();
// //         // auto start playing current track
// //         if (!_player.playing) {
// //           _play();
// //         }
// //       } else {
// //         _controller.reverse();
// //         _player.pause();
// //         widget.onZkrTrackChanged("-1");
// //       }
// //     });
// //   }
// //
// //   @override
// //   void didChangeDependencies() {
// //     super.didChangeDependencies();
// //     final screenWidth = MediaQuery.sizeOf(context).width;
// //
// //     _widthAnimation = Tween<double>(
// //       begin: 56,
// //       end: screenWidth - 35,
// //     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
// //   }
// //
// //   @override
// //   void dispose() {
// //     _player.dispose();
// //     _controller.dispose();
// //     super.dispose();
// //   }
// //
// //   // 3 - Check if we are at the last voice in the playlist
// //   bool get _isAtLastVoice => _currentPlaylistIndex >= _lastPlaylistIndex;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedBuilder(
// //       animation: _widthAnimation,
// //       builder: (context, child) {
// //         return Container(
// //           margin: const EdgeInsets.only(bottom: 16, right: 16),
// //           child: PrimaryContainer(
// //             opacity: 0.5,
// //             margin: 0,
// //             padding: 0,
// //             child: InkWell(
// //               borderRadius: BorderRadius.circular(30),
// //               onTap: toggleExpand,
// //               child: SizedBox(
// //                 height: 56,
// //                 width: _widthAnimation.value,
// //                 child: Directionality(
// //                   textDirection: TextDirection.ltr,
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                     children: isExpanded && _controller.isCompleted
// //                         ? [
// //                       IconButton(
// //                         icon: const Icon(
// //                           Icons.skip_previous,
// //                           size: 30,
// //                           color: Colors.white,
// //                         ),
// //                         onPressed: _skipPrevious,
// //                       ),
// //                       StreamBuilder<PlayerState>(
// //                           stream: _player.playerStateStream,
// //                           builder: (context, snapshot) {
// //                             final isPlaying = snapshot.data?.playing ?? false;
// //                             return IconButton(
// //                               icon: Icon(
// //                                 isPlaying ? Icons.pause : Icons.play_arrow,
// //                                 size: 35,
// //                                 color: Colors.white,
// //                               ),
// //                               onPressed: _togglePlayPause,
// //                             );
// //                           }),
// //                       IconButton(
// //                         icon: const Icon(
// //                           Icons.skip_next,
// //                           size: 30,
// //                           color: Colors.white,
// //                         ),
// //                         // 3 - Disable skip button if at the end
// //                         onPressed: _isAtLastVoice ? null : _skipNext,
// //                       ),
// //                     ]
// //                         : const [
// //                       Icon(
// //                         Icons.play_arrow,
// //                         size: 30,
// //                         color: Colors.white,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// //
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:new_azkar/models/PrimaryContainer.dart';
// import 'package:new_azkar/pages/zkrPage/providers/zkr_provider.dart';
// import 'package:provider/provider.dart';
//
// class ExpandingAudioButton extends StatefulWidget {
//
//   const ExpandingAudioButton({
//     super.key,
//   });
//
//   @override
//   State<ExpandingAudioButton> createState() => _ExpandingAudioButtonState();
// }
//
// class _ExpandingAudioButtonState extends State<ExpandingAudioButton>
//     with SingleTickerProviderStateMixin {
//   bool isExpanded = false;
//   bool isPlaying = false;
//   int _audioIndex = 0;
//   int _indexRepetition = 1;
//   var tracks = [];
//   bool built =false;
//   late AnimationController _controller;
//   late Animation<double> _widthAnimation;
//   final _player = AudioPlayer();
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//
//     _player.playerStateStream.listen((state) {
//       setState(() {
//         isPlaying = state.playing;
//       });
//     });
//
//   }
//
//
//
//
//   void _buildPlaylist() {
//     var sources = tracks.map((track) {
//       return AudioSource.asset(track["path"]!);
//     }).toList();
//     // print("sources :${sources}");
//     _player.setAudioSources(sources);
//     built=true;
//   }
//
//   void _onAudioComplete(BuildContext context) async {
//     final repeat = int.parse(tracks[_audioIndex]["repeat"] ?? "1");
//     print("repeast is:$repeat");
//     if (_indexRepetition < repeat) {
//       print("in");
//       _indexRepetition++;
//       await _player.seek(Duration.zero);
//       await _player.play();
//       context.read<ZkrProvider>().onZkrRepeat();
//     } else {
//       _indexRepetition = 1;
//       // widget.onRepeatDecrease?.call(_audioIndex);
//
//       if (_audioIndex < tracks.length - 1) {
//         await _player.seekToNext();
//       } else {
//         await _player.stop();
//         setState(() => isPlaying = false);
//       }
//     }
//   }
//
//   void _togglePlayPause() {
//     if (isPlaying) {
//       _player.pause();
//     } else {
//       _player.play();
//     }
//   }
//
//   void _skipNext() {
//     if (_audioIndex < tracks.length - 2) {
//       _player.seekToNext();
//     }
//   }
//
//   void _skipPrevious() {
//     if (_audioIndex > 0) {
//       _player.seekToPrevious();
//     }
//   }
//
//   void toggleExpand() {
//     if (tracks.isEmpty) {
//       print("no tracks");
//       return;
//     }
//     isExpanded = !isExpanded;
//     if (isExpanded) {
//       _controller.forward();
//       if (!isPlaying) _player.play();
//     } else {
//       _controller.reverse();
//     }
//     setState(() {
//
//     });
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final screenWidth = MediaQuery.sizeOf(context).width;
//     _widthAnimation = Tween<double>(begin: 56, end: screenWidth - 35)
//         .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//   }
//
//   @override
//   void dispose() {
//     _player.dispose();
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     tracks = context.watch<ZkrProvider>().tracks;
//     _player.currentIndexStream.listen((index) {
//       if (index != null && index != context.read<ZkrProvider>().currentIndex) {
//         setState(() => _audioIndex = index);
//         context.read<ZkrProvider>().setCurrentIndex(index);
//       }
//     });
//
//     _player.processingStateStream.listen((state) {
//       if (state == ProcessingState.completed) {
//         _onAudioComplete(context);
//       }
//     });
//
//
//     if (tracks.isNotEmpty) {
//       if(!built){
//       _buildPlaylist();}
//     }else {
//       return const SizedBox.shrink();
//     }
//     return AnimatedBuilder(
//       animation: _widthAnimation,
//       builder: (context, child) {
//         return Container(
//           margin: const EdgeInsets.only(bottom: 16, right: 16),
//           child: PrimaryContainer(
//             opacity: 0.5,
//             margin: 0,
//             padding: 0,
//             child: InkWell(
//               borderRadius: BorderRadius.circular(30),
//               onTap: (){
//                 print("in btn");
//                 toggleExpand();},
//               child: SizedBox(
//                 height: 56,
//                 width: _widthAnimation.value,
//                 child: Directionality(
//                   textDirection: TextDirection.ltr,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: isExpanded && _controller.isCompleted
//                         ? [
//                       IconButton(
//                         icon: const Icon(Icons.skip_previous,
//                             size: 30, color: Colors.white),
//                         onPressed:
//                         _audioIndex > 0 ? _skipPrevious : null,
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           isPlaying ? Icons.pause : Icons.play_arrow,
//                           size: 35,
//                           color: Colors.white,
//                         ),
//                         onPressed: _togglePlayPause,
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.skip_next,
//                             size: 30, color: Colors.white),
//                         onPressed: _audioIndex <
//                             tracks.length - 1
//                             ? _skipNext
//                             : null,
//                       ),
//                     ]
//                         : const [
//                       Icon(Icons.play_arrow,
//                           size: 30, color: Colors.white),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
