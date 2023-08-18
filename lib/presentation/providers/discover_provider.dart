import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repositories.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Repository, DataSources (local, remote, etc)

  final VideoPostsRepositoryImpl videoRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoRepository});

  Future<void> loadNextPage() async {
    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();
    final newVideos = await videoRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
