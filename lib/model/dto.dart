import 'package:searchengine/util/constants.dart';
import 'package:meta/meta.dart';

@immutable
class NewsItemDto {
  final String id;
  final String title;
  final String description;
  final String displayLink;
  final String link;
  final String imageUrl;

  NewsItemDto({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.displayLink,
    @required this.link,
    @required this.imageUrl,
  })  : assert(id != null),
        assert(title != null),
        assert(description != null),
        assert(displayLink != null),
        assert(link != null);

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return this.title;
  }
}

class NotificationItemDto {
  final String title;
  final String body;
  final String link;

  NotificationItemDto({
    @required this.title,
    @required this.body,
    @required this.link,
  })  : assert(title != null),
        assert(body != null);

  factory NotificationItemDto.create(Map<String, dynamic> data) {
    return NotificationItemDto(
        title: data['title'] ?? 'title',
        body: data['body'] ?? 'body',
        link: data['link'] ?? Constants.APP_LINK);
  }
}

class BrowserItemDto {
  final String title;
  final String link;

  BrowserItemDto({
    @required this.title,
    @required this.link,
  })  : assert(title != null),
        assert(link != null);

  factory BrowserItemDto.fromNotification(NotificationItemDto notification) {
    return BrowserItemDto(
      title: notification.title,
      link: notification.link,
    );
  }

  factory BrowserItemDto.fromNewsItem(NewsItemDto newsItem) {
    return BrowserItemDto(
      title: newsItem.title,
      link: newsItem.link,
    );
  }
}
