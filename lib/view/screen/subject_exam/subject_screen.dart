import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/sbject_exam_controller/subject_screen_controller.dart';
import 'package:quiz_app/model/subject_exam/exam_subject_model.dart';
import 'package:quiz_app/view/components/global_appbar_widget.dart';
import 'package:quiz_app/view/components/subject_related_widget.dart';
import 'package:quiz_app/view/screen/subject_exam/topic_screen.dart';

class SubjectScreen extends StatelessWidget {
  SubjectScreen({super.key});
  final SubjectScreenController controller = Get.put(SubjectScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(title: 'Subject List'),
      body: buildSubjectList(context),
    );
  }

  buildSubjectList(BuildContext context) {
    return FutureBuilder<ExamSubjectModal>(
        future: controller.fetchAllExamSubject(),
        builder: (context, AsyncSnapshot<ExamSubjectModal> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.data.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.to(SubjectTopicList(
                        subjectId: snapshot.data!.data[index].id.toString(),
                      )),
                      child: subjectListContainer(
                          title: snapshot.data!.data[index].subjectName),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
