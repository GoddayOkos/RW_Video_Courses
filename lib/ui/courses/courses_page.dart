import 'package:flutter/material.dart';
import 'package:rw_courses/constants.dart';
import 'package:rw_courses/model/course.dart';
import 'package:rw_courses/repository/course_repository.dart';
import 'package:rw_courses/ui/course_detail/course_detail_page.dart';
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

       return ListView.builder(
         padding: const EdgeInsets.all(16.0),
         itemCount: courses.length,
           itemBuilder: (BuildContext context, int position) {
              return _buildRow(courses[position]);
           }
       );
     },
   );
  }

  Widget _buildRow(Course course) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(course.name, style: const TextStyle(fontSize: 18.0)),
        ),
        trailing: Hero(
          tag: "cardArtwork-${course.courseId}",
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(course.artworkUrl),
          ),
        ),
        subtitle: Text(course.domainString),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CourseDetailsPage(course: course))
          );
        },
      ),
    );
  }

}