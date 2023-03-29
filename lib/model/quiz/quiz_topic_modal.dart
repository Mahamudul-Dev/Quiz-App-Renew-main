class QuizTopicsModal {
  QuizTopicsModal({
    required this.error,
    required this.data,
  });
  late final bool error;
  late final List<Data> data;

  QuizTopicsModal.fromJson(Map<String, dynamic> json) {
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
    required this.quizSubjectId,
    required this.topicName,
    required this.createdAt,
    this.updatedAt,
    required this.quizNumbers,
  });
  late final int id;
  late final String quizSubjectId;
  late final String topicName;
  late final String createdAt;
  late final Null updatedAt;
  late final List<QuizNumbers> quizNumbers;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizSubjectId = json['quiz_subject_id'];
    topicName = json['topic_name'];
    createdAt = json['created_at'];
    updatedAt = null;
    quizNumbers = List.from(json['quiz_numbers'])
        .map((e) => QuizNumbers.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['quiz_subject_id'] = quizSubjectId;
    _data['topic_name'] = topicName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['quiz_numbers'] = quizNumbers.map((e) => e.toJson()).toList();
    return _data;
  }
}

class QuizNumbers {
  QuizNumbers({
    required this.id,
    required this.quizTopicId,
    required this.quizNumber,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String quizTopicId;
  late final String quizNumber;
  late final Null createdAt;
  late final Null updatedAt;

  QuizNumbers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizTopicId = json['quiz_topic_id'];
    quizNumber = json['quiz_number'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['quiz_topic_id'] = quizTopicId;
    _data['quiz_number'] = quizNumber;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
