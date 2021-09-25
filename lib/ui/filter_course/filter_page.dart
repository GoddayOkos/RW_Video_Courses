import 'package:flutter/material.dart';
import 'package:rw_courses/strings.dart';
import 'package:rw_courses/ui/filter_course/filter_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
 int _filterValue = Constants.allFilter;

 @override
  void initState() {
   super.initState();
   _loadValue();
 }

  _loadValue() async {
   final prefs = await SharedPreferences.getInstance();
   setState(() {
     _filterValue = prefs.getInt(Constants.filterKey);
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.filter),
          backgroundColor: Colors.green.shade800
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FilterWidget(
            value: Constants.iosFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.ios,
          ),
          FilterWidget(
            value: Constants.androidFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.android,
          ),
          FilterWidget(
            value: Constants.sssFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.sss,
          ),
          FilterWidget(
            value: Constants.unityFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.unity,
          ),
          FilterWidget(
            value: Constants.macosFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.macos,
          ),
          FilterWidget(
            value: Constants.flutterFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.flutter,
          ),
          FilterWidget(
            value: Constants.allFilter,
            groupValue: _filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.all,
          )
        ],
      ),
    );
  }

  void _handleRadioValueChange(int? value) async {
   final prefs = await SharedPreferences.getInstance();
    setState(() {
      _filterValue = value!;
      prefs.setInt(Constants.filterKey, _filterValue);
    });
  }
}
