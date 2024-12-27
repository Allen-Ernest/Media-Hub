import 'package:flutter/material.dart';
import 'package:media_hub/home/home.dart';
import 'package:media_hub/search/audio_search_page.dart';
import 'package:media_hub/app_intro/app_intro.dart';
import 'package:media_hub/trash/trash.dart';
import 'package:media_hub/downloads/media_downloader.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => const HomePage(),
  '/audio_search': (context) => const AudioSearchPage(),
  '/intro': (context) => const AppIntroPage(),
  '/trash': (context) => const TrashPage(),
  '/media_downloader': (context) => const MediaDownloadPage()
};