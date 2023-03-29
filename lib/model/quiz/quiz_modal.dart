class QuizNumberModal {
  QuizNumberModal({
    required this.error,
    required this.data,
  });
  late final bool error;
  late final List<Data> data;

  QuizNumberModal.fromJson(Map<String, dynamic> json) {
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
    required this.quizTopicId,
    required this.quizNumber,
    this.createdAt,
    this.updatedAt,
    required this.quizes,
  });
  late final int id;
  late final String quizTopicId;
  late final String quizNumber;
  late final Null createdAt;
  late final Null updatedAt;
  late final List<Quizes> quizes;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizTopicId = json['quiz_topic_id'];
    quizNumber = json['quiz_number'];
    createdAt = null;
    updatedAt = null;
    quizes = List.from(json['quizes']).map((e) => Quizes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['quiz_topic_id'] = quizTopicId;
    _data['quiz_number'] = quizNumber;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['quizes'] = quizes.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Quizes {
  Quizes({
    required this.id,
    required this.quizSubjectId,
    required this.quizTopicsId,
    required this.quizNumberId,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.correctAns,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String quizSubjectId;
  late final String quizTopicsId;
  late final String quizNumberId;
  late final String question;
  late final String option1;
  late final String option2;
  late final String option3;
  late final String option4;
  late final String correctAns;
  late final String createdAt;
  late final String updatedAt;

  Quizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizSubjectId = json['quiz_subject_id'];
    quizTopicsId = json['quiz_topics_id'];
    quizNumberId = json['quiz_number_id'];
    question = json['question'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    correctAns = json['correct_ans'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['quiz_subject_id'] = quizSubjectId;
    _data['quiz_topics_id'] = quizTopicsId;
    _data['quiz_number_id'] = quizNumberId;
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
