import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ExtrasPage extends StatefulWidget {
  const ExtrasPage({super.key});

  @override
  State<ExtrasPage> createState() => _ExtrasPageState();
}

class _ExtrasPageState extends State<ExtrasPage> {
  void streamMedia() async {
    //Check either wifi or mobile data is on before streaming
    //When connection is turned off abort playback
    //Enable catching
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text('Recent',style: TextStyle(
          fontSize: 18
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GFButton(onPressed: () {
              Navigator.pushNamed(context, '/settings');
            }, color: Colors.green, text: 'Settings'),
            GFButton(onPressed: () {}, color: Colors.green, text: 'About')
          ],
        ),
        ListTile(
          leading: const Icon(Icons.settings_input_antenna),
          title: const Text('Stream'),
          onTap: () {},
        ),
        ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Video Downloader'),
            onTap: () {
              Navigator.pushNamed(context, '/media_downloader');
            }),
        ListTile(
          leading: const Icon(Icons.construction),
          title: const Text('Tools'),
          onTap: () {
            showModalBottomSheet(
                showDragHandle: true,
                context: context,
                builder: (BuildContext context) => ListView(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.palette),
                          title: const Text('Photo editor'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.video_camera_front),
                          title: const Text('Video Editor'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.palette),
                          title: const Text('MP4 - Audio Converter'),
                          onTap: () {},
                        ),
                      ],
                    ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('Trash'),
          onTap: (){
            Navigator.pushNamed(context, '/trash');
          },
        )

      ],
    );
  }
}

//.MOV .MP4
