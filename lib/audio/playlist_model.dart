import 'package:media_hub/audio/audio_model.dart';

class PlaylistModel {
  String playlistId;
  String playlistName;
  List<AudioModel> tracks;

  PlaylistModel({
    required this.playlistId,
    required this.playlistName,
    required this.tracks
  });

  /*Map<String, dynamic> toJson() =>
      {
        'playListId': playlistId,
        'playListName': playlistName,
        'tracks': tracks
      };

  factory PlaylistModel.fromJson(Map<String, dynamic> json) => PlaylistModel(
    playlistId: 'playlistId',
    playlistName: 'playlistName',
    tracks: 'tracks'
  );*/
}