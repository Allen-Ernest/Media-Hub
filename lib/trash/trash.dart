import 'package:flutter/material.dart';

class TrashPage extends StatefulWidget {
  const TrashPage({super.key});

  @override
  State<TrashPage> createState() => _TrashPageState();
}

class _TrashPageState extends State<TrashPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Trash'),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete)
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.restore_from_trash)
                )
              ],
              bottom: const TabBar(tabs: [Tab(
                text: 'Photos',
                icon: Icon(Icons.photo),
              ),
                Tab(
                  text: 'Videos',
                  icon: Icon(Icons.movie),
                ),
                Tab(
                  text: 'Audio',
                  icon: Icon(Icons.audiotrack),
                )
              ]),
            ),
            body: const Padding(
                padding: EdgeInsets.all(8.0),
                child: DefaultTabController(
                    length: 3, child: TabBarView(children: [
                  Text(
                      'Deleted Photos will appear here'
                  ),
                  Text('Deleted Videos will appear here'),
                  Text('Deleted audio will appear here')
                ]))
            )
        )
    );
  }
}
