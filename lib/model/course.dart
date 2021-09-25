class Course {
  final String courseId;
  final String name;
  final String description;
  final String artworkUrl;
  final String difficulty;
  final String contributors;

  Course({
    required this.courseId,
    required this.name,
    required this.description,
    required this.artworkUrl,
    required this.difficulty,
    required this.contributors
});

  Course.fromJson(Map<String, dynamic> json)
    : courseId = json["id"],
      name = json["attributes"]["name"],
      description = json["attributes"]["description_plain_text"],
      artworkUrl = json["attributes"]["card_artwork_url"],
      difficulty = json["attributes"]["difficulty"],
      contributors = json["attributes"]["contributor_string"];

  @override
  String toString() {
    return name + ": " + difficulty;
  }
}