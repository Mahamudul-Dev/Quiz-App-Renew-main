import 'dart:convert';

import 'package:get/get.dart';
import 'package:quiz_app/api/api_urls.dart';
import 'package:quiz_app/model/subject_exam/sub_exam_question_modal.dart';
import 'package:http/http.dart' as http;

class SubExamQuestionController extends GetxController {
  Future<SubExamQuestionModal> getQuestions(String topicId) async {
    final response =
        await http.get(Uri.parse(ApiUrl.subExamQuestionApi + topicId));
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return SubExamQuestionModal.fromJson(data);
    } else {
      return SubExamQuestionModal.fromJson(data);
    }
  }
}
