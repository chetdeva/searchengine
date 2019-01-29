import 'package:searchengine/model/dto.dart';
import 'package:searchengine/network/entity.dart';

abstract class Mapper<Entity, Dto> {
  Dto mapFromEntity(Entity entity);
}

class ResultItemMapper implements Mapper<ResultEntity, List<NewsItemDto>> {

  final Mapper<ItemEntity, NewsItemDto> mapper = NewsItemMapper();

  @override
  List<NewsItemDto> mapFromEntity(ResultEntity entity) {
    return entity.items
        .map((itemEntity) => mapper.mapFromEntity(itemEntity))
        .toList();
  }
}

class NewsItemMapper implements Mapper<ItemEntity, NewsItemDto> {
  @override
  NewsItemDto mapFromEntity(ItemEntity entity) {
    return NewsItemDto(
      id: entity.hashCode.toString(),
      title: entity.title,
      description: entity.snippet,
      displayLink: entity.displayLink,
      link: entity.link,
      imageUrl: entity.thumbnailUrl,
    );
  }
}
