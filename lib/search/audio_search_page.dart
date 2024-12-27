import 'package:flutter/material.dart';

class AudioSearchPage extends StatefulWidget {
  const AudioSearchPage({super.key});

  @override
  State<AudioSearchPage> createState() => _AudioSearchPageState();
}

class _AudioSearchPageState extends State<AudioSearchPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Search')
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Colors.green
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Colors.green
                        )
                    )
                )
            )
        )
    );
  }
}

