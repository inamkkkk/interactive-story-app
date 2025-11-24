class StoryNode {
  String id;
  String text;
  List<Choice>? choices;

  StoryNode({required this.id, required this.text, this.choices});

  factory StoryNode.fromJson(Map<String, dynamic> json) {
    return StoryNode(
      id: json['id'],
      text: json['text'],
      choices: (json['choices'] as List<dynamic>?)?.map((choiceJson) => Choice.fromJson(choiceJson)).toList(),
    );
  }
}

class Choice {
  String text;
  String nextNodeId;

  Choice({required this.text, required this.nextNodeId});

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      text: json['text'],
      nextNodeId: json['nextNodeId'],
    );
  }
}