import 'package:rw_courses/model/course.dart';
import 'package:rw_courses/repository/course_repository.dart';
import 'package:rw_courses/repository/repository.dart';

class CourseController {
  final Repository _repository = CourseRepository();

  Future<List<Course>> fetchCourses(int domainFilter) =>
      _repository.getCourses(domainFilter);
}