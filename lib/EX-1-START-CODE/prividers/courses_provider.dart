import 'package:t2_w6_p1/EX-1-START-CODE/models/course.dart';
import 'package:t2_w6_p1/EX-1-START-CODE/repositories/courses_mock_repository.dart';
import 'package:t2_w6_p1/EX-1-START-CODE/repositories/courses_repository.dart';

class CoursesProvider {
  final CoursesRepository _repository = CoursesMockRepository();
  List<Course> getCourses() {
    return _repository.getCourses();
  }

  Course getCourseFor(String courseName) {
    var course = _repository.getCourses();
    for (int i = 0; i < course.length; i++) {
      if (courseName == course[i].name) {
        return course[i];
      }
    }
    throw Exception('Course not found: $courseName');
  }

  void addScore(String courseName, CourseScore score) {
    final course = getCourseFor(courseName);
    _repository.addScore(course, score);
  }
}
