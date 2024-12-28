import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:media_hub/database/database_helper.dart';
import '../videos/video_model.dart';

class VideoStreamingPage extends StatefulWidget {
  const VideoStreamingPage({super.key});

  @override
  State<VideoStreamingPage> createState() => _VideoStreamingPageState();
}

class _VideoStreamingPageState extends State<VideoStreamingPage> {
  final TextEditingController uriController = TextEditingController();
  List<VideoModel> streams = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Stream'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
            ],
            bottom: const TabBar(tabs: [
              Tab(text: 'Stream', icon: Icon(Icons.settings_input_antenna)),
              Tab(text: 'Watch history', icon: Icon(Icons.history))
            ]),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  TabBarView(children: [
                    Column(
                      children: [
                        TextField(
                          controller: uriController,
                        ),
                      ],
                    ),
                    ListView.builder(itemBuilder: (context, index){
                      if (streams.isEmpty){
                        return const Text('No recent streams');
                      } else {
                        //for every stream the thumbnails must be cached
                      }
                    })
                  ])
                ],
              )),
        ));
  }
}
