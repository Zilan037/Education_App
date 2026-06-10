import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // تعداد کورس‌های کاربر
  Future<int> getCoursesCount(String userId) async {
    final snapshot = await _db
        .collection('courses')
        .where('students', arrayContains: userId)
        .get();

    return snapshot.docs.length;
  }

  // تعداد assignment های کاربر
  Future<int> getAssignmentsCount(String userId) async {
    final snapshot = await _db
        .collection('assignments')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.length;
  }

  // تعداد quiz های کاربر
  Future<int> getQuizCount(String userId) async {
    final snapshot = await _db
        .collection('quizzes')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.length;
  }

  // پیام‌ها (مثلاً inbox)
  Future<int> getMessagesCount(String userId) async {
    final snapshot = await _db
        .collection('messages')
        .where('receiverId', isEqualTo: userId)
        .where('read', isEqualTo: false)
        .get();

    return snapshot.docs.length;
  }

  // اطلاعات کاربر
  Future<Map<String, dynamic>> getUserInfo(String userId) async {
    final doc = await _db.collection('users').doc(userId).get();

    return doc.data() ?? {};
  }
}