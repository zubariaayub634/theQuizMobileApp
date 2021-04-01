class GameModel {
  final List<LevelModel> levels;
  int coins = 20;

  GameModel({
    this.levels,
    this.coins,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      levels: (json['Levels'] as List)
              .map((e) => LevelModel.fromJson(e))
              .toList() ??
          [],
      coins: json['coins'],
    );
  }

  Map<String, dynamic> toJson() => {
        'levels': levels.map((e) => e.toJson()).toList(),
        'coins': coins,
      };

  void saveProgress() async {}
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
  DateTime lockedTill = DateTime.now().subtract(Duration(days: 50));
  bool correctlyAnswered = false;
  List<Options> options;

  Question({
    this.correctAnswer,
    this.url,
    this.options,
    this.question,
    this.type,
    this.lockedTill,
    this.correctlyAnswered,
  });

  Map<String, dynamic> toJson() => {
        'type': type,
        'url': url,
        'correctAnswer': correctAnswer,
        'question': question,
        'lockedTill': lockedTill,
        'correctlyAnswered': correctlyAnswered,
        'options': options,
      };

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      options:
          (json['option'] as List).map((e) => Options.fromJson(e)).toList() ??
              [],
      type: json['type'] ?? "",
      url: json['url'] ?? "",
      question: json['question'] ?? "",
      correctAnswer: json['correctAnswer'] ?? "",
      lockedTill: json['lockedTill'] ?? "",
      correctlyAnswered:
          (json['correctlyAnswered'].toString() ?? "") == "true" ? true : false,
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
