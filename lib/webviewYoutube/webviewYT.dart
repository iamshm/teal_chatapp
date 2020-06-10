import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewYoutube extends StatefulWidget {
  static const String id = "WEBVIEWYOUTUBE";
  @override
  _WebViewYoutubeState createState() => _WebViewYoutubeState();
}

class _WebViewYoutubeState extends State<WebViewYoutube> {
  String uri = "https://www.youtube.com/embed/5VbAwhBBHsg";
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: WebView(
            initialUrl: Uri.dataFromString(
                    '<html><body><iframe width="440" height="315" src="https://www.youtube.com/embed/5VbAwhBBHsg?rel=0&controls=0&color=white&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></body></html>',
                    mimeType: 'text/html')
                .toString(),
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (uri) {
              _controller.evaluateJavascript(
                  "document.getElementsByClassName('ytp-youtube-button ytp-button yt-uix-sessionlink').style.display='none';"
                  "console.log(document.querySelectorAll('ytp-youtube-button ytp-button yt-uix-sessionlink'));");
            }

            //  modestbranding="1"
            ),
      )),
    );
  }
}
