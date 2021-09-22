import 'package:rw_courses/model/course.dart';

abstract class Repository {
  Future<List<Course>> getCourses(int domainFilter);
}