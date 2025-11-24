import 'package:flutter/material.dart';
import 'package:interactive_story_app/screens/story_screen.dart';
import 'package:provider/provider.dart';
import 'package:interactive_story_app/providers/story_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => StoryProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Story',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StoryScreen(),
    );
  }
}