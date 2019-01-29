import 'package:flutter/material.dart';
import 'package:searchengine/bloc/news_bloc.dart';
import 'package:searchengine/bloc/news_provider.dart';
import 'package:searchengine/model/dto.dart';
import 'package:searchengine/navigation/navigation.dart';
import 'package:searchengine/util/constants.dart';
import 'package:searchengine/util/utils.dart';

class NewsScreen extends StatefulWidget {
  static const String routeName = "/news";
  final NewsBloc newsBloc;

  NewsScreen({@required this.newsBloc}) : assert(newsBloc != null);

  @override
  _NewsScreenState createState() => _NewsScreenState(newsBloc);
}

class _NewsScreenState extends State<NewsScreen> {
  static const String _placeholderAssetPath =
      'assets/icons/ic_image_placeholder.png';

  NewsBloc _newsBloc;
  bool _isSearching = false;

  _NewsScreenState(this._newsBloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? _buildSearchTextField(context)
            : Text(Constants.APP_NAME),
        actions: <Widget>[
          IconButton(
            icon: Icon(_isSearching ? Icons.clear : Icons.search),
            color: Colors.white,
            onPressed: onSearchActionPressed,
          )
        ],
      ),
      body: _buildNews(),
    );
  }

  TextField _buildSearchTextField(BuildContext context) {
    return TextField(
      onSubmitted: onSearchQuerySubmitted,
      cursorColor: Colors.white,
      autofocus: true,
      style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: "Search...",
          hintStyle:
              Theme.of(context).textTheme.title.copyWith(color: Colors.white)),
    );
  }

  void onSearchActionPressed() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }

  void onSearchQuerySubmitted(String query) {
    _newsBloc.query.add(query);
  }

  StreamBuilder<List<NewsItemDto>> _buildNews() {
    return StreamBuilder<List<NewsItemDto>>(
      stream: _newsBloc.items,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildNewsItems(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildCenteredText(snapshot.error.toString());
        }

        // By default, show a loading spinner
        return _buildCenteredText('Search 🕵️‍♂️');
      },
    );
  }

  Center _buildCenteredText(String title) {
    return Center(
      child: Text(
        title,
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }

  ListView _buildNewsItems(List<NewsItemDto> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildNewsItem(items[index]);
      },
    );
  }

  ListTile _buildNewsItem(NewsItemDto item) {
    return ListTile(
      leading: Image(
          fit: BoxFit.cover,
          width: 40.0,
          height: 40.0,
          image: ImageUtils.applyImage(item.imageUrl, _placeholderAssetPath)),
      title: Text(item.title.toString(),
          style: Theme.of(context).textTheme.subhead),
      subtitle: Text(
        item.displayLink,
        style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.blue),
      ),
      onTap: () => _onNewsItemTap(item),
    );
  }

  void _onNewsItemTap(NewsItemDto newsItem) =>
      Navigation.of(context).toBrowserFromNews(newsItem);

  @override
  void dispose() {
    _disposeNewsBloc();
    super.dispose();
  }

  void _disposeNewsBloc() => _newsBloc.dispose();
}
