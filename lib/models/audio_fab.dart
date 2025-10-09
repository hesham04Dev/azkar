import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:new_azkar/models/PrimaryContainer.dart';

class ExpandingAudioButton extends StatefulWidget {
  final List<Map<String, String>> tracks;
  const ExpandingAudioButton({super.key, required this.tracks});

  @override
  State<ExpandingAudioButton> createState() => _ExpandingAudioButtonState();
}

class _ExpandingAudioButtonState extends State<ExpandingAudioButton>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  bool isPlaying = false;

  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  final AudioPlayer _player = AudioPlayer();
  int _audioIndex = 0;
  int _indexRepetition = 1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // When audio finishes, go to next
    _player.onPlayerComplete.listen((_) {
      _onAudioComplete(
        repeat: int.parse(widget.tracks[_audioIndex]["repeat"] ?? "1"),
      );
      // _skipNext(auto: true,);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenWidth = MediaQuery.sizeOf(context).width;

    _widthAnimation = Tween<double>(
      begin: 56,
      end: screenWidth - 35,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  Future<void> _playAudio() async {
    final audio = widget.tracks[_audioIndex];
    final path = audio["path"]!.replaceFirst("assets/", "");
    try {
      // print("tryyyyyyyyyyy");
      await rootBundle.load(audio["path"] ?? "");

      await _player.stop();
      await _player.play(AssetSource(path));

      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      // print("dNNNNNNNNNN");
      _skipNext(auto: true);
    }
  }

  void _togglePlayPause() {
    if (isPlaying) {
      _player.pause();
      setState(() => isPlaying = false);
    } else {
      _player.resume();
      setState(() => isPlaying = true);
    }
  }

  void _skipNext({bool auto = false}) {
    if (_audioIndex < widget.tracks.length - 1) {
      _audioIndex++;
      _playAudio();
    } else if (auto) {
      // stop at end of list
      _indexRepetition = 1;
      _audioIndex = 0;
      toggleExpand();
      setState(() => isPlaying = false);
    }
  }

  void _onAudioComplete({required int repeat}) {
    if (_indexRepetition < repeat) {
      _indexRepetition++;
      _playAudio();
    } else {
      _indexRepetition = 1;
      _skipNext(auto: true);
    }
  }

  void _skipPrevious() {
    if (_audioIndex > 0) {
      _indexRepetition = 1;
      _audioIndex--;
      _playAudio();
    }
  }

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _controller.forward();
        // auto start playing current track
        if (!isPlaying) {
          _playAudio();
        }
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              onTap: toggleExpand,
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
                              icon: const Icon(
                                Icons.skip_previous,
                                size: 30,
                                color: Colors.white,
                              ),
                              onPressed: _skipPrevious,
                            ),
                            IconButton(
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                size: 35,
                                color: Colors.white,
                              ),
                              onPressed: _togglePlayPause,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.skip_next,
                                size: 30,
                                color: Colors.white,
                              ),
                              onPressed: _skipNext,
                            ),
                          ]
                        : const [
                            Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: Colors.white,
                            ),
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
