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
  WebViewController _myController;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Container(
          child: WebView(
              initialUrl: Uri.dataFromString(
                      '<html><body><iframe width="440" height="315" src="https://www.youtube.com/embed/5VbAwhBBHsg?rel=0&controls=0&color=red&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></body></html>',
                      mimeType: 'text/html')
                  .toString(),
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
                _myController = webViewController;
              },
              onPageFinished: (uri) async {
                String result1 =
                    await _myController.evaluateJavascript("10 + 20;");
                print(result1); // 30

                var result2 = await _myController.evaluateJavascript("""
                      var allClasses = [];

                      var allElements = document.querySelectorAll('*');

                      for (var i = 0; i < allElements.length; i++) {
                        var classes = allElements[i].className.toString().split(/\s+/);
                        for (var j = 0; j < classes.length; j++) {
                          var cls = classes[j];
                          if (cls && allClasses.indexOf(cls) === -1)
                            allClasses.push(cls);
                        }
                      }

                      return (allClasses);

                      """);
                print(result2);
              }),
        )),
      ),
    );
  }
}
