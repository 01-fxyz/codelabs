import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class YouTubeVideoWidget extends StatelessWidget {
  final String videoId;

  YouTubeVideoWidget({required this.videoId});

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      '<iframe width="560" height="315" src="https://www.youtube.com/embed/$videoId" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
      webView: true,
    );
  }
}
