import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:interactive_story_app/models/story_node.dart';

class DatabaseService {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  DatabaseService._privateConstructor();
  static final DatabaseService instance = DatabaseService._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS story (
        id TEXT PRIMARY KEY,
        text TEXT
      )
    ''');
  }

  Future<List<StoryNode>> loadStoryData() async {
    // Load the story data from a JSON file.
    final String jsonString = await _loadStoryJson();
    final jsonData = jsonDecode(jsonString) as List<dynamic>;

    return jsonData.map((item) => StoryNode.fromJson(item)).toList();
  }

  Future<String> _loadStoryJson() async {
    // Placeholder for loading the JSON.  In a real app, you'd load this from a file.
    return '''
[
  {
    "id": "1",
    "text": "You find yourself in a dark forest. A path leads to the north, and a river flows to the east. Which way do you go?",
    "choices": [
      {
        "text": "Go north",
        "nextNodeId": "2"
      },
      {
        "text": "Go east",
        "nextNodeId": "3"
      }
    ]
  },
  {
    "id": "2",
    "text": "You walk along the path and come to a clearing. In the center of the clearing is a small cottage. Do you approach the cottage?",
    "choices": [
      {
        "text": "Approach the cottage",
        "nextNodeId": "4"
      },
      {
        "text": "Turn back",
        "nextNodeId": "1"
      }
    ]
  },
  {
    "id": "3",
    "text": "You follow the river and find a boat. Do you take the boat?",
    "choices": [
      {
        "text": "Take the boat",
        "nextNodeId": "5"
      },
      {
        "text": "Continue along the river",
        "nextNodeId": "1"
      }
    ]
  },
  {
    "id": "4",
    "text": "You knock on the door of the cottage. A kindly old woman answers. She offers you tea and a place to rest. You accept her offer and live happily ever after.",
    "choices": [
      {
        "text": "You win!",
        "nextNodeId": "END"
      }
    ]
  },
  {
    "id": "5",
    "text": "You sail down the river and encounter a dragon. The dragon eats you.",
    "choices": [
      {
        "text": "You lose!",
        "nextNodeId": "END"
      }
    ]
  }
]
    ''';
  }
}
