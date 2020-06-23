import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewYoutube extends StatefulWidget {
  static const String id = "WEBVIEWYOUTUBE";
  @override
  _WebViewYoutubeState createState() => _WebViewYoutubeState();
}

class _WebViewYoutubeState extends State<WebViewYoutube> {
  String uri = "https://www.youtube.com/embed/5VbAwhBBHsg";
  // String uri = "https://iamshm.github.io/check-app/";
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
              initialUrl:
                  //  "https://iamshm.github.io/check-app/",
                  Uri.dataFromString(
                          '<html><body><iframe src="https://player.vimeo.com/video/226500452" width="640" height="360" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe></body></html>',
                          mimeType: 'text/html')
                      .toString(),
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
                _myController = webViewController;
              },
              onPageFinished: (uri) async {
                _myController.evaluateJavascript(
                    "console.log(document.documentElement.innerHTML);");
                // _myController.evaluateJavascript("""
                // var allClasses = [];

                // var allElements = document.querySelectorAll('*');

                // for (var i = 0; i < allElements.length; i++) {
                //   var classes = allElements[i].className.toString().split(/\s+/);
                //   for (var j = 0; j < classes.length; j++) {
                //     var cls = classes[j];
                //     if (cls && allClasses.indexOf(cls) === -1)
                //       allClasses.push(cls);
                //   }
                // }

                // console.log(allClasses);
                //   """);
                // setState(() {});
              }),
        )),
      ),
    );
  }
}
// document.getElementsByClassName('ytp-chrome-top ytp-show-cards-title')[0].style.display='none';
//  document.getElementsByClassName('ytp-chrome-top-buttons')[0].style.display='none';
//              document.getElementsByClassName('ytp-title')[0].style.display='none';
//              document.getElementsByClassName('ytp-watermark yt-uix-sessionlink ytp-watermark-small')[0].style.display='none';
