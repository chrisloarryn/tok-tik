import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentacion/widgets/shared/video_buttons.dart';
import 'package:toktik/presentacion/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost video = videos[index];
        return Stack(
          children: [
            // TODO: VideoPlayer
            // FullScreenPlayer(video: video),
            SizedBox.expand(
                child: FullScreenPlayer(
              videoUrl: video.videoUrl,
              caption: video.caption,
            )),

            // TODO: VideoButtons
            Positioned(bottom: 40, right: 20, child: VideoButtons(video: video))
          ],
        );
      },
    );
  }
}
