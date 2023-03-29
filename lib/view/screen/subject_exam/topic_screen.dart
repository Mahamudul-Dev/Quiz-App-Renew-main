import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/sbject_exam_controller/subject_screen_controller.dart';
import 'package:quiz_app/model/subject_exam/exam_topic_modal.dart';
import 'package:quiz_app/view/components/global_appbar_widget.dart';
import 'package:quiz_app/view/components/subject_related_widget.dart';

import 'exam_questions.dart';

class SubjectTopicList extends StatelessWidget {
  SubjectTopicList({super.key, required this.subjectId});
  final String subjectId;

  final SubjectScreenController controller = Get.put(SubjectScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(title: 'Topcs'),
      body: buildTopicList(context, subjectId),
    );
  }

  buildTopicList(BuildContext context, String subId) {
    return FutureBuilder<ExamTopicModal>(
        future: controller.fetchTopicBySubject(subId),
        builder: (context, AsyncSnapshot<ExamTopicModal> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.data.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.to(SubExamQuestionScreen(
                        topicId: snapshot.data!.data[index].id.toString(),
                      )),
                      child: subjectListContainer(
                          title: snapshot.data!.data[index].topicName),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
