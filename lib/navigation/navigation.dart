import 'dart:async';

import 'package:flutter/material.dart';
import 'package:searchengine/model/dto.dart';
import 'package:searchengine/screen/browser.dart';

class Navigation {
  final BuildContext context;

  Navigation(this.context);

  static Navigation of(BuildContext context) => Navigation(context);

  Future<Null> toBrowserFromNews(NewsItemDto newsItem) {
    return _toBrowser(BrowserItemDto.fromNewsItem(newsItem));
  }

  Future<Null> toBrowserFromNotification(NotificationItemDto notificationItem) {
    return _toBrowser(BrowserItemDto.fromNotification(notificationItem));
  }

  bool pop() {
    return Navigator.of(context).pop();
  }

  Future<Null> _toBrowser(BrowserItemDto browserItem) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BrowserScreen(browserItem: browserItem);
        },
      ),
    );
  }
}
