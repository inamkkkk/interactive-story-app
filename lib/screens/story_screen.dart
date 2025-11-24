import 'package:flutter/material.dart';
import 'package:interactive_story_app/models/story_node.dart';
import 'package:interactive_story_app/providers/story_provider.dart';
import 'package:provider/provider.dart';
import 'package:interactive_story_app/screens/end_screen.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StoryProvider>(context, listen: false).loadStory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final storyProvider = Provider.of<StoryProvider>(context);

    if (storyProvider.currentNode == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('The Adventure Begins')), // App bar added
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              storyProvider.currentNode!.text,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            ...(storyProvider.currentNode!.choices?.map((choice) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (choice.nextNodeId == 'END') {
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EndScreen(message: choice.text)),
                        );
                    } else {
                      storyProvider.makeChoice(choice.nextNodeId);
                    }

                  },
                  child: Text(choice.text),
                ),
              );
            }) ?? []),
          ],
        ),
      ),
    );
  }
}