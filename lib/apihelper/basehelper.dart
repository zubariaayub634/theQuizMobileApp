import 'package:flutter/cupertino.dart';
import 'package:thequestion/models/questionModel.dart';
import 'dart:convert';

class BaseHelper {
  Future<dynamic> getLevels(BuildContext context) async {
    var data = await DefaultAssetBundle.of(context)
        .loadString("myquestions/questions.json");

    final jsonResult = json.decode(data);
    print(jsonResult['Levels'][0]['Questions'][0]['option']);
    QuestionModel questionModel = QuestionModel.fromJson(jsonResult);
    print("model data:");
    print(questionModel.result.length);

    return questionModel.result;
    // print(jsonResult['Levels'].lenght);
    //
    // print(questionModel.result);
    // return questionModel.result;
  }
}
//That's Wrong! try it after 30 min