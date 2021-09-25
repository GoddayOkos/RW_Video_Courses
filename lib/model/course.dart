
import 'package:rw_courses/constants.dart';

import 'domain.dart';

class Course {
  final String courseId;
  final String name;
  final String description;
  final String artworkUrl;
  final String difficulty;
  final String contributors;
  final List<Domain> domains;

  Course({
    required this.courseId,
    required this.name,
    required this.description,
    required this.artworkUrl,
    required this.difficulty,
    required this.contributors,
    required this.domains
});

  Course.fromJson(Map<String, dynamic> json)
    : courseId = json["id"],
      name = json["attributes"]["name"],
      description = json["attributes"]["description_plain_text"],
      artworkUrl = json["attributes"]["card_artwork_url"],
      difficulty = json["attributes"]["difficulty"],
      contributors = json["attributes"]["contributor_string"],
      domains = [] {
        var domainData = json["relationships"]["domains"]["data"] as List<dynamic>;
        if (domainData.isNotEmpty) {
          for (var i = 0; i < domainData.length; i++) {
            var domain =
            Course.getDomain(json["relationships"]["domains"]["data"][i]["id"]);
            domains.add(domain);
          }
        }
  }

  static Domain getDomain(String domainId) {
    switch (domainId) {
      case Constants.iosDomain:
        return Domain.ios;
      case Constants.androidDomain:
        return Domain.android;
      case Constants.unityDomain:
        return Domain.unity;
      case Constants.sssDomain:
        return Domain.sss;
      case Constants.flutterDomain:
        return Domain.flutter;
      case Constants.macosDomain:
        return Domain.macos;
      case Constants.archivedDomain:
        return Domain.archived;
      default:
        return Domain.unknown;
    }
  }

  get domainString {
    String result = "";
    for (var i = 0; i < domains.length - 1; i++) {
      result += domains[i].name + ", ";
    }
    result += domains.last.name;
    return result;
  }

  @override
  String toString() {
    return name + ": " + domainString;
  }
}