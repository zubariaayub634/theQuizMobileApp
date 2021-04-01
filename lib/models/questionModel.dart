class GameModel {
  final List<LevelModel> levels;
  int coins = 20;

  GameModel({
    this.levels,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      levels: (json['Levels'] as List)
              .map((e) => LevelModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class LevelModel {
  List<Question> questions;
  String name;
  LevelModel({this.questions, this.name});

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      questions: (json['Questions'] as List)
              .map((e) => Question.fromJson(e))
              .toList() ??
          [],
      name: json['name'],
    );
  }

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
  DateTime lockedTill = DateTime.now().subtract(Duration(days: 50));
  bool correctlyAnswered = false;
  List<Options> options;
  Question(
      {this.correctAnswer, this.url, this.options, this.question, this.type});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      options:
          (json['option'] as List).map((e) => Options.fromJson(e)).toList() ??
              [],
      type: json['type'] ?? "",
      url: json['url'] ?? "",
      question: json['question'] ?? "",
      correctAnswer: json['correctAnswer'] ?? "",
    );
  }
}

class Options {
  var optionName;

  Options({this.optionName});

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      optionName: json['optionName'] ?? "",
    );
  }
}
