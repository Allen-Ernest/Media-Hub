import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MediaDownloadPage extends StatefulWidget {
  const MediaDownloadPage({super.key});

  @override
  State<MediaDownloadPage> createState() => _MediaDownloadPageState();
}

class _MediaDownloadPageState extends State<MediaDownloadPage> {
  final TextEditingController uriController = TextEditingController();
  bool isLoading = false;

  Future<void> downloadFile() async {
    String? uri = uriController.text.trim();
    if (uri.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please, insert a Uri to download file')));
      return;
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Checking permissions')));
    await Permission.storage.request();
    if (await Permission.storage.isGranted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Checking connection')));
      final List<ConnectivityResult> connectivityResults =
          await Connectivity().checkConnectivity();
      if (connectivityResults.contains(ConnectivityResult.mobile) ||
          connectivityResults.contains(ConnectivityResult.wifi)) {
        //Parse media
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Parsing Uri')));
        Response response = await Dio().get(uri);
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Media Available')));
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Display thumbnail'),
                        Text('Choose resolution'),
                      ],
                    ),
                  ),
                  actions: [
                    GFButton(
                        onPressed: () {},
                        color: Colors.green,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Icon(Icons.download), Text('Download')],
                        )),
                    GFButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.red,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Icon(Icons.cancel), Text('Cancel')],
                        ))
                  ],
                );
              });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text(
                "Unable to download file ensure mobile data or Wi-Fi is enabled"),
            action: SnackBarAction(label: 'Retry', onPressed: downloadFile)));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Storage Permission is required to download files')));
      return;
    }
    //Request permission
    //Create a file named Media Hub Downloads
    //Check network status
    //Downloads should pause if network is down
    //Downloads should proceed even if the app is running in the background
    //the download process should have to time estimation basing on download speed
    //Parse media
    //Choose download format
    //Allow extracting audio from videos
    //Show download sizes
    //Show progress in notification panel
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Downloader'), actions: <Widget>[
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        TextButton(onPressed: () {}, child: const Text('Clear'))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                  controller: uriController,
                  decoration: InputDecoration(
                      hintText: 'Insert Uri',
                      suffixIcon: IconButton(
                          onPressed: () {
                            downloadFile();
                          },
                          icon: const Icon(Icons.download_for_offline_sharp,
                              color: Colors.green)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.green)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.green)))),
              Row(
                children: <GFButton>[
                  GFButton(onPressed: () {}, text: ('All')),
                  GFButton(onPressed: () {}, text: ('Progressing')),
                  GFButton(onPressed: () {}, text: ('Pending')),
                  GFButton(onPressed: () {}, text: ('Completed'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//maximum of 3 downloads per time

class DownloadsList extends StatefulWidget {
  const DownloadsList({super.key});

  @override
  State<DownloadsList> createState() => _DownloadsListState();
}

class _DownloadsListState extends State<DownloadsList> {
  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}
