import '../../domain/entities/video_post.dart';

class LocalVideoModel {
  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json['name'] ?? 'No name',
        videoUrl: json['videoUrl'] ?? 'No videoUrl',
        likes: json['likes'] ?? 0,
        views: json['views'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'videoUrl': videoUrl,
        'likes': likes,
        'views': views,
      };

  VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videoUrl: videoUrl,
        likes: likes,
        views: views,
      );

  static List<LocalVideoModel> fromJsonList(
          List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => LocalVideoModel.fromJson(json)).toList();

  static List<Map<String, dynamic>> toJsonList(List<LocalVideoModel> videos) =>
      videos.map((video) => video.toJson()).toList();

  static List<VideoPost> toEntityList(List<LocalVideoModel> videos) =>
      videos.map((video) => video.toVideoPostEntity()).toList();
}
