import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/api/api_urls.dart';
import 'package:quiz_app/model/quiz/quiz-subject.dart';

class QuizSubjectController extends GetxController {
  List<QuizSubjectModal> quizeSubjectList = [];

  Future<List<QuizSubjectModal>> getQuizeSubjectList() async {
    final response = await http.get(Uri.parse(ApiUrl.quizSubjectsApi),
        headers: {
          'Authorization': 'Bearer 16|pVqbengoqh1WaLSVNXxTfLoWc77Qq006BAjsfLe6'
        });
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      quizeSubjectList.clear();
      for (Map<String, dynamic> i in data) {
        quizeSubjectList.add(QuizSubjectModal.fromJson(i));
      }
    } else {
      print('failed');
      print(quizeSubjectList.length);
      return quizeSubjectList;
    }
    print('success');
    print(quizeSubjectList.length);
    return quizeSubjectList;
  }
}
