import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:indore/main.dart';
import 'package:provider/provider.dart';
import 'package:indore/components/sliding_tab.dart';

class DronePOV extends StatefulWidget {
  const DronePOV({Key? key}) : super(key: key);

  @override
  State<DronePOV> createState() => _DronePOVState();
}

class _DronePOVState extends State<DronePOV> {
  late VideoPlayerController _controller;
  bool _isControllerInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer(
        Provider.of<MyAppState>(context, listen: false).currentTabIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeVideoPlayer(int tabIndex) {
    print('changed to: $tabIndex');
    if (tabIndex == 0) {
      _controller = VideoPlayerController.asset('assets/earthquake.mp4');
    } else if (tabIndex == 1) {
      _controller = VideoPlayerController.asset('assets/flood.mp4');
    }

    _controller.initialize().then((_) {
      if (mounted) {
        setState(() {
          _isControllerInitialized = true;
        });
        _controller.play();
      }
    });
    _controller.setLooping(true); // Set looping if needed
  }

  @override
  void didChangeDependencies() {
    final tabIndex = Provider.of<MyAppState>(context).currentTabIndex;

    // Dispose of the previous controller if it exists
    _controller.dispose();

    // Initialize the new video player based on the updated tab index
    _initializeVideoPlayer(tabIndex);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final tabIndex = Provider.of<MyAppState>(context).currentTabIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            const SlidingTab(tab1: "POV-A", tab2: "POV-B"),
            const SizedBox(
              height: 60,
            ),
            _isControllerInitialized
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : Container(
                  child: Column(
                    children: [
                      CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Connecting...",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }
}
