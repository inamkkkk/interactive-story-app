import 'package:flutter/material.dart';
import 'package:interactive_story_app/models/story_node.dart';
import 'package:interactive_story_app/services/database_service.dart';

class StoryProvider extends ChangeNotifier {
  List<StoryNode> _storyNodes = [];
  StoryNode? _currentNode;
  final DatabaseService _databaseService = DatabaseService.instance;

  StoryNode? get currentNode => _currentNode;

  Future<void> loadStory() async {
    _storyNodes = await _databaseService.loadStoryData();
    _currentNode = _storyNodes.first;
    notifyListeners();
  }

  void makeChoice(String nextNodeId) {
    _currentNode = _storyNodes.firstWhere((node) => node.id == nextNodeId);
    notifyListeners();
  }
}