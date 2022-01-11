import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class View extends StatefulWidget {
  const View({ Key? key }) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

final Completer<WebViewController> _controller = Completer<WebViewController>();
final flutterWebviewPlugin = new FlutterWebviewPlugin();

class _ViewState extends State<View> {

  @override
   void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }

    Map data = {};

  @override
  Widget build(BuildContext context) {

    if (data.isNotEmpty) {
      data = data;
    } else {
      data = ModalRoute.of(context)?.settings.arguments as Map;
    }
    String url = data['url'];
    String title = data['title'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(194, 15, 85, 1),
            fontFamily: 'Comfortaa',
          ),
        ),
        backgroundColor: const Color.fromRGBO(27, 37, 47, 1),
        elevation: 0,
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webcontroller){
                _controller.complete(webcontroller);
        },  
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.home),
        backgroundColor: const Color.fromRGBO(194, 15, 85, 1),
      ),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        color: const Color.fromRGBO(27, 37, 47, 1),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 70),
              IconButton(
                tooltip: 'Share Page',
                icon: const Icon(Icons.share_rounded, color: Color.fromRGBO(194, 15, 85, 1)),
                onPressed: () async {
                  // String currentUrl = await _controller.future.then((controller) => controller.currentUrl());
                  // if (currentUrl == null ){
                  //   Share.share(url);
                  // } else {
                  //   Share.share(currentUrl);
                  // }
                  },
              ),
              const SizedBox(width: 10),
              IconButton(
                tooltip: 'Info',
                icon: const Icon(Icons.info_outline_rounded, color: Color.fromRGBO(194, 15, 85, 1)),
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              IconButton(
                tooltip: 'Back',
                icon: const Icon(Icons.arrow_back_outlined, color: Color.fromRGBO(194, 15, 85, 1)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}