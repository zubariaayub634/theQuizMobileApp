import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class GameModel {
  List<LevelModel> levels;
  int coins = 20;

  GameModel({
    this.levels,
    this.coins,
  });

  static Future<GameModel> fromJson(Map<String, dynamic> json) async {
    GameModel g = GameModel(
      levels: []
    );
    await g.updateProgress();
    if (g.levels.length == 0) {
      g.levels = (json['levels'] as List)
              .map((e) => LevelModel.fromJson(e))
              .toList() ??
          [];
      g.coins = json['coins'] ?? 20;
    }
    return g;
  }

  Map<String, dynamic> toJson() => {
        'levels': levels.map((e) => e.toJson()).toList(),
        'coins': coins,
      };

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/questionsProgress.json');
  }

  Future<void> updateProgress() async {
    try {
      File file = File('${await _localPath}/questionsProgress.json');
      String fileContent = await file.readAsString();

      final jsonData = json.decode(fileContent);
      print(jsonData);
      if (jsonData != null && jsonData['levels'] != null) {
        levels.addAll((jsonData['levels'] as List)
                .map((e) => LevelModel.fromJson(e))
                .toList() ??
            []);
      }
      if (jsonData != null && jsonData['coins'] != null) {
        coins = coins ?? (jsonData['coins'] ?? 20);
      }
      print('File Content: $fileContent');
    } catch (FileSystemException) {} //means no progress to update
  }

  void saveProgress() async {
    print("entered save progress");
    File file = await _localFile;
    if (await file.exists() == false)
      file = await File('${await _localPath}/questionsProgress.json')
          .create(recursive: true);

    print("filepath");
    print(file.path);

    Map<String, dynamic> json = toJson();

    print(json);

    String jsonString = jsonEncode(json);

    // Write the file.
    file.writeAsString(jsonString);
    print("exit save progress");
  }
}

class LevelModel {
  List<Question> questions;
  String name;
  LevelModel({this.questions, this.name});

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    print("in level factory");
    print(json);
    return LevelModel(
      questions: (json['questions'] as List)
              .map((e) => Question.fromJson(e))
              .toList() ??
          [],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'questions': questions.map((e) => e.toJson()).toList(),
        'name': name,
      };

  double getCorrectlyAnsweredPercentage() {
    int totalCorrect = 0;
    for (Question q in questions) {
      if (q.correctlyAnswered) totalCorrect++;
    }
    return 100 * totalCorrect.toDouble() / questions.length;
  }
}

class Question {
  final type;
  final url;
  final correctAnswer;
  final question;
  DateTime lockedTill;
  bool correctlyAnswered;
  List<String> options;

  Question({
    this.correctAnswer,
    this.url,
    this.options,
    this.question,
    this.type,
    this.lockedTill,
    this.correctlyAnswered = false,
  }) {
    if (this.lockedTill == null) {
      this.lockedTill = DateTime.now().subtract(Duration(days: 50));
    }
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'url': url,
        'correctAnswer': correctAnswer,
        'question': question,
        'lockedTill': lockedTill.millisecondsSinceEpoch.toString(),
        'correctlyAnswered': correctlyAnswered.toString(),
        'options': options,
      };

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      options:
          (json['options'] as List).map((e) => e.toString()).toList() ?? [],
      type: json['type'] ?? "",
      url: json['url'] ?? "",
      question: json['question'] ?? "",
      correctAnswer: json['correctAnswer'] ?? "",
      lockedTill: json['lockedTill'] == null
          ? DateTime.now().subtract(Duration(days: 50))
          : DateTime.fromMicrosecondsSinceEpoch(int.parse(json['lockedTill'])),
      correctlyAnswered:
          (json['correctlyAnswered'].toString() ?? "") == "true" ? true : false,
    );
  }
}
