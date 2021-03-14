class QuestionModel {
  final List<LevelResult> result;

  QuestionModel({
    this.result,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      result: (json['Levels'] as List)
              .map((e) => LevelResult.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class LevelResult {
  List<Question> questions;
  int index;
  LevelResult({this.questions, this.index});

  factory LevelResult.fromJson(Map<String, dynamic> json) {
    return LevelResult(
      questions: (json['Questions'] as List)
              .map((e) => Question.fromJson(e))
              .toList() ??
          [],
    );
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
