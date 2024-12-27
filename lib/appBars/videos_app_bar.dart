import 'package:flutter/material.dart';

class VideosAppbar extends StatefulWidget {
  const VideosAppbar({super.key, required this.onHighlight});
  final Function onHighlight;

  @override
  State<VideosAppbar> createState() => _VideosAppbarState();
}

class _VideosAppbarState extends State<VideosAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Videos'),
      actions: [
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.search),
        ),
        IconButton(onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.refresh),
                  title: const Text('Refresh'),
                  onTap: (){},
                )
              ],
            )
          );
        }, icon: const Icon(Icons.more_vert))
      ]
    );
  }
}