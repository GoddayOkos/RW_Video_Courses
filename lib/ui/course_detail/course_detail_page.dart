import 'package:flutter/material.dart';
import 'package:rw_courses/model/course.dart';
import 'package:rw_courses/ui/course_detail/image_container.dart';

class CourseDetailsPage extends StatelessWidget {
  final Course course;

  const CourseDetailsPage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.name)),
      body: const Text("Course Details"),
    );
  }
  
  Widget _buildBanner() {
    return ImageContainer(
      height: 200,
      url: course.artworkUrl,
    );
  }
}