class Course {
  final String courseId;
  final String name;
  final String description;

  Course({
    required this.courseId,
    required this.name,
    required this.description
});

  Course.fromJson(Map<String, dynamic> json)
    : courseId = json["id"],
      name = json["attributes"]["name"],
      description = json["attributes"]["description_plain_text"];

  @override
  String toString() {
    return name;
  }
}