import 'package:flutter/material.dart';
import 'package:media_hub/videos/video_model.dart';

class VideoSearchPage extends StatefulWidget {
  const VideoSearchPage({super.key, required this.allVideos});

  final List<VideoModel> allVideos;

  @override
  State<VideoSearchPage> createState() => _VideoSearchPageState();
}

class _VideoSearchPageState extends State<VideoSearchPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for Videos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                  label: const Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(12))),
            )
          ],
        ),
      ),
    );
  }
}

class VideoSearchResults extends StatefulWidget {
  const VideoSearchResults({super.key, required this.searchResults});

  final List<VideoModel> searchResults;

  @override
  State<VideoSearchResults> createState() => _VideoSearchResultsState();
}

class _VideoSearchResultsState extends State<VideoSearchResults> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {});
  }
}
