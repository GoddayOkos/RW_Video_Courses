import 'package:flutter/material.dart';
import 'package:rw_courses/rwcourses_app.dart';
import 'package:rw_courses/strings.dart';

void main() => runApp(MaterialApp(
      title: Strings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green.shade800),
      home: const RWCoursesApp(),
    ));
