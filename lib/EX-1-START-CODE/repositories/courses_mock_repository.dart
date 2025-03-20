import 'package:t2_w6_p1/EX-1-START-CODE/models/course.dart';
import 'package:t2_w6_p1/EX-1-START-CODE/repositories/courses_repository.dart';

class CoursesMockRepository implements CoursesRepository {
  final List<Course> _courses = [Course(name: 'HTML'), Course(name: 'JAVA')];

  @override
  void addScore(Course course, CourseScore score) {
    for (var i = 0; i < _courses.length; i++) {
      if (course.name == _courses[i].name) {
        _courses[i].addScore(score);
        break;
      }
    }
  }

  @override
  List<Course> getCourses() {
    return _courses;
  }
}
