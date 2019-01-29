import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:searchengine/model/dto.dart';

class BrowserScreen extends StatefulWidget {
  static const String routeName = "/browser";

  final BrowserItemDto browserItem;

  BrowserScreen({this.browserItem});

  @override
  _BrowserScreenState createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  @override
  Widget build(BuildContext context) {
    final title = widget.browserItem.title;
    final url = widget.browserItem.link;
    return _buildWebView(title, url);
  }

  Widget _buildWebView(String title, String url) {
    return WebviewScaffold(
      url: url,
      appBar: new AppBar(
        title: Text(title),
      ),
      withZoom: true,
      withLocalStorage: true,
    );
  }
}
