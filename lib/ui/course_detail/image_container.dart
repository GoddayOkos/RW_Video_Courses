import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  double? width;
  final double height;
  final Color placeholder;
  final String url;

  ImageContainer({
    Key? key,
    this.width,
    required this.height,
    this.placeholder = const Color(0xFFEEEEEE),
    required this.url
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: placeholder,
        image: url.contains("http")
            ? DecorationImage(image: NetworkImage(url)) : null
      ),
    );
  }

}