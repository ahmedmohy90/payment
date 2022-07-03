import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:payment/models/final_id.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../shared/component/constants.dart';

class VisaCardScrren
 extends StatefulWidget {
  const VisaCardScrren
  ({Key? key}) : super(key: key);

  @override
  State<VisaCardScrren> createState() => _VisaCardScrrenState();
}

class _VisaCardScrrenState extends State<VisaCardScrren> {
   final Completer<WebViewController> _controller =
      Completer<WebViewController>();

    @override
   void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SafeArea(
        child: WebView(
          initialUrl: 'https://accept.paymob.com/api/acceptance/iframes/377881?payment_token=$FinalTokencard',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
          backgroundColor: const Color(0x00000000),
        ),
      ),
    
    );
   
  
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  
  }
}