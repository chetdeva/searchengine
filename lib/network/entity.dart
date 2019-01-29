class ResultEntity {
  final List<ItemEntity> items;

  ResultEntity({this.items});

  factory ResultEntity.fromJson(Map<String, dynamic> json) {
    final items =
        (json['items'] as List).map((i) => ItemEntity.fromJson(i)).toList();
    return ResultEntity(items: items);
  }
}

class ItemEntity {
  final String kind;
  final String title;
  final String htmlTitle;
  final String link;
  final String displayLink;
  final String snippet;
  final String htmlSnippet;
  final String cacheId;
  final String formattedUrl;
  final String htmlFormattedUrl;
  final Map<String, dynamic> pagemap;

  ItemEntity({
    this.kind,
    this.title,
    this.htmlTitle,
    this.link,
    this.displayLink,
    this.snippet,
    this.htmlSnippet,
    this.cacheId,
    this.formattedUrl,
    this.htmlFormattedUrl,
    this.pagemap,
  });

  factory ItemEntity.fromJson(Map<String, dynamic> json) {
    return ItemEntity(
      kind: json['kind'],
      title: json['title'],
      htmlTitle: json['htmlTitle'],
      link: json['link'],
      displayLink: json['displayLink'],
      snippet: json['snippet'],
      htmlSnippet: json['htmlSnippet'],
      cacheId: json['cacheId'],
      formattedUrl: json['formattedUrl'],
      htmlFormattedUrl: json['htmlFormattedUrl'],
      pagemap: json['pagemap'],
    );
  }

  String get thumbnailUrl {
    if (pagemap != null && pagemap['cse_thumbnail'] != null) {
      final cseThumbnails = (pagemap['cse_thumbnail'] as List)
          .map((i) => CseThumbnailEntity.fromJson(i))
          .toList();
      return cseThumbnails.length > 0 ? cseThumbnails[0]?.src : null;
    } else {
      return null;
    }
  }

  @override
  int get hashCode => title.hashCode;
}

class CseThumbnailEntity {
  final String src;
  final String width;
  final String height;

  CseThumbnailEntity({this.src, this.width, this.height});

  factory CseThumbnailEntity.fromJson(Map<String, dynamic> json) {
    return CseThumbnailEntity(
        src: json['src'], width: json['width'], height: json['height']);
  }
}
