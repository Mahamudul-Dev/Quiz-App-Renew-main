import 'dart:convert';

import 'package:get/get.dart';
import 'package:quiz_app/api/api_urls.dart';
import 'package:quiz_app/model/subject_exam/exam_subject_model.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/model/subject_exam/exam_topic_modal.dart';

class SubjectScreenController extends GetxController {
  // fetch exam subject
  Future<ExamSubjectModal> fetchAllExamSubject() async {
    final response = await http.get(Uri.parse(ApiUrl.subjectiveExamSubject));
    final data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ExamSubjectModal.fromJson(data);
    } else {
      return ExamSubjectModal.fromJson(data);
    }
  }

  // fetch exam topics list by subject id
  Future<ExamTopicModal> fetchTopicBySubject(String subId) async {
    final response = await http.get(Uri.parse(ApiUrl.topicListBySubId + subId));
    final data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ExamTopicModal.fromJson(data);
    } else {
      return ExamTopicModal.fromJson(data);
    }
  }
}
