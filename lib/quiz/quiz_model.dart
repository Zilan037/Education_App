import 'package:education_app/quiz/question_model.dart';

class QuizModel {
  final String id;
  final String title;
  final List<QuestionModel> questions;

  QuizModel({
    required this.id,
    required this.title,
    required this.questions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json['id'],
      title: json['title'],
      questions: (json['questions'] as List)
          .map((e) => QuestionModel.fromJson(e))
          .toList(),
    );
  }
}