import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Concurrent Downloads'),
            trailing: const Text('3'),
            onTap: (){},
          )
        ],
      ),
    );
  }
}
