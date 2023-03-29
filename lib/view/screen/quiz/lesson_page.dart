import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/view/components/global_appbar_widget.dart';
import 'package:quiz_app/view/components/subject_related_widget.dart';
import 'package:quiz_app/view/screen/quiz/quizNumber.dart';

class QuizLession extends StatefulWidget {
  final String subjectName;
  final List? topicList;
  const QuizLession({Key? key, required this.subjectName, this.topicList})
      : super(key: key);

  @override
  State<QuizLession> createState() => _QuizLessionState();
}

class _QuizLessionState extends State<QuizLession> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(title: widget.subjectName),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: widget.topicList != null
              ? ListView.builder(
                  itemCount: widget.topicList!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.to(QuizNumberPage(
                        topicId: widget.topicList![index]['id'].toString(),
                      )),
                      child: subjectListContainer(
                          title: widget.topicList![index]['topic_name']
                              .toString()),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    'No Data Found!',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
    );
  }
}
