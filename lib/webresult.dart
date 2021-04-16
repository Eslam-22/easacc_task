
import 'package:easacc_task/webviewpage.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebResult extends StatefulWidget {
  @override
  _WebResultState createState() => _WebResultState();
  final customer;
  WebResult({this.customer});
}

class _WebResultState extends State<WebResult> {
  @override
  Widget build(BuildContext context) {
    var x=widget.customer;
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top : 30.0),
          child:WebView(

            initialUrl: 'https://$x/',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
