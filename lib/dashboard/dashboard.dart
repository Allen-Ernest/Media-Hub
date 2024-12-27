import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        Text('Recent Playback',style: TextStyle(fontSize: 19)),
        Text('Albums',style: TextStyle(fontSize: 19)),
        Text('Playlists',style: TextStyle(fontSize: 19)),
      ],
    );
  }
}
