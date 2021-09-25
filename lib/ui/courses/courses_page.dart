import 'package:flutter/material.dart';
import 'package:rw_courses/constants.dart';
import 'package:rw_courses/model/course.dart';
import 'package:rw_courses/repository/course_repository.dart';
import 'package:rw_courses/ui/courses/courses_controller.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CourseController(CourseRepository());

  @override
  Widget build(BuildContext context) {
   return FutureBuilder<List<Course>>(
     future: _controller.fetchCourses(Constants.allFilter),
     builder: (context, snapshot) {
       var courses = snapshot.data;
       if (courses == null) {
         return const Center(child: CircularProgressIndicator());
       }

       return Text(courses.toString());
     },
   );
  }

}