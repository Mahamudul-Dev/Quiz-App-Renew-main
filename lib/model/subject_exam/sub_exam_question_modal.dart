class SubExamQuestionModal {
  SubExamQuestionModal({
    required this.error,
    required this.data,
  });
  late final bool error;
  late final List<Data> data;

  SubExamQuestionModal.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.subjectId,
    required this.topicId,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.correctAns,
    required this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String subjectId;
  late final String topicId;
  late final String question;
  late final String option1;
  late final String option2;
  late final String option3;
  late final String option4;
  late final String correctAns;
  late final String createdAt;
  late final Null updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subject_id'];
    topicId = json['topic_id'];
    question = json['question'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    correctAns = json['correct_ans'];
    createdAt = json['created_at'];
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['subject_id'] = subjectId;
    _data['topic_id'] = topicId;
    _data['question'] = question;
    _data['option1'] = option1;
    _data['option2'] = option2;
    _data['option3'] = option3;
    _data['option4'] = option4;
    _data['correct_ans'] = correctAns;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
