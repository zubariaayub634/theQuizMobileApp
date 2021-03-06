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
  List<Questions> questions;
  int index;
  LevelResult({this.questions,this.index});

  factory LevelResult.fromJson(Map<String, dynamic> json) {
    return LevelResult(
      questions: (json['Questions'] as List)
              .map((e) => Questions.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Questions {
  var type;
  var url;
  var correctAnswer;
  var question;
  List<Options> options;
  Questions(
      {this.correctAnswer, this.url, this.options, this.question, this.type});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      options: (json['option'] as List).map((e) => Options.fromJson(e)).toList() ??
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
