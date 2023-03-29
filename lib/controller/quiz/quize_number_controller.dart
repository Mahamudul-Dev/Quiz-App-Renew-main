import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/api/api_urls.dart';
import 'package:quiz_app/model/quiz/quiz_modal.dart';

class QuizNumberController extends GetxController {
  Future<QuizNumberModal> getQuiz(String topicId) async {
    final response = await http.get(Uri.parse(ApiUrl.quiztByTopicApi + topicId),
        headers: {
          'Authorization': 'Bearer 16|pVqbengoqh1WaLSVNXxTfLoWc77Qq006BAjsfLe6'
        });
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return QuizNumberModal.fromJson(data);
    } else {
      return QuizNumberModal.fromJson(data);
    }
  }
}
