import 'package:flutter/material.dart';
import 'package:searchengine/bloc/injection.dart';
import 'package:searchengine/bloc/news_bloc.dart';

class NewsProvider extends InheritedWidget {
  static final injection = Injection();
  final NewsBloc newsBloc;

  NewsProvider({
    Key key,
    NewsBloc newsBloc,
    Widget child,
  })  : newsBloc = newsBloc ?? injection.provideNewsBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static NewsBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(NewsProvider) as NewsProvider)
          .newsBloc;
}
