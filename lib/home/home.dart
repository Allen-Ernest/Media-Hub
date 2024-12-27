import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media_hub/photos/photos.dart';
import 'package:media_hub/dashboard/dashboard.dart';
import 'package:media_hub/videos/videos.dart';
import 'package:media_hub/audio/audio.dart';
import 'package:media_hub/extras/extras.dart';
import 'package:getwidget/getwidget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:media_hub/photos/image_model.dart';
import 'package:media_hub/audio/audio_model.dart';
import 'package:media_hub/videos/video_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ImageModel> images = [];
  List<VideoModel> videos = [];
  List<AudioModel> audio = [];

  Future<void> queryImageFiles() async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final List<FileSystemEntity> files = directory.listSync();
      final List<File> imageFiles = files
          .where((file) =>
              file is File &&
              (file.path.endsWith('.png') ||
                  file.path.endsWith('.jpg') ||
                  file.path.endsWith('.jpeg') ||
                  file.path.endsWith('.svg')))
          .map((file) => File(file.path))
          .toList();
      for (var image in imageFiles) {
        final File imageFile = File(image.path);
        final String imagePath = image.path;
        final String imageTitle = image.path.split('/').last.split('.').first;
        final fileStat = await image.stat();
        final int size = await image.length();
        final creationDate = fileStat.changed;
        final imageModel = ImageModel(
            name: imageTitle,
            size: size,
            dateCreated: creationDate,
            path: imagePath,
            file: imageFile);
        setState(() {
          images.add(imageModel);
        });
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Error fetching Image Files'),
          action: SnackBarAction(label: 'Retry', onPressed: fetchMediaFiles)));
    }
  }

  Future<void> queryAudioFiles() async {}

  Future<void> queryVideoFiles() async {}

  bool isLoading = true;

  Future<void> fetchMediaFiles() async {
    setState(() {
      isLoading = true;
    });
    await Permission.storage.request();
    if (await Permission.storage.isGranted) {
      await queryVideoFiles();
      await queryImageFiles();
      await queryAudioFiles();
      setState(() {
        isLoading = false;
      });
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Storage permission is required")));
    }
  }

  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<NavigationDestination> destinations = [
    const NavigationDestination(
        selectedIcon: Icon(Icons.dashboard),
        icon: Icon(Icons.dashboard_outlined),
        label: 'Dashboard'),
    const NavigationDestination(
        selectedIcon: Icon(Icons.image),
        icon: Icon(Icons.image_outlined),
        label: 'Photos'),
    const NavigationDestination(
        selectedIcon: Icon(Icons.movie),
        icon: Icon(Icons.movie_outlined),
        label: 'Videos'),
    const NavigationDestination(
        selectedIcon: Icon(Icons.audiotrack),
        icon: Icon(Icons.audiotrack_outlined),
        label: 'Music'),
    const NavigationDestination(
        selectedIcon: Icon(Icons.more_horiz),
        icon: Icon(Icons.more_horiz_outlined),
        label: 'Extras'),
  ];

  @override
  void initState() {
    fetchMediaFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const DashboardPage(),
      PhotosPage(photos: images),
      const VideosPage(),
      const AudioPage(),
      const ExtrasPage()
    ];
    List<AppBar> appBars = [
      AppBar(
        title: const Text('Dashboard'),
      ),
      AppBar(title: const Text('Photos'), actions: [
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  builder: (BuildContext context) => ListView(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.slideshow),
                            title: const Text('Slideshow'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.slideshow),
                            title: const Text('Create album'),
                            onTap: () {},
                          )
                        ],
                      ));
            },
            icon: const Icon(Icons.more_vert))
      ]),
      AppBar(
        title: const Text('Videos'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      AppBar(
        title: const Text('Audio'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shuffle)),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => ListView(
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.refresh),
                              title: const Text('Refresh'),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Icons.queue_music),
                              title: const Text('Playlists'),
                              onTap: () {},
                            ),
                            GFButton(
                              onPressed: () {},
                              color: Colors.green,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.playlist_add),
                                  Text('Create New Playlist'),
                                ],
                              ),
                            )
                          ],
                        ));
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      AppBar(
        title: const Text('Extras'),
      ),
    ];
    return Scaffold(
      appBar: appBars[currentIndex],
      body: isLoading
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(8.0), child: pages[currentIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
          indicatorColor: Colors.green.withOpacity(0.5),
          onDestinationSelected: onItemTapped, destinations: destinations),
    );
  }
}

//TODO: APP rating
//TODO: Design picture card
