import 'package:t2_w6_p1/EX-1-START-CODE/models/course.dart';

abstract class CoursesRepository {
  List<Course> getCourses();

  void addScore(Course course, CourseScore score);
}
