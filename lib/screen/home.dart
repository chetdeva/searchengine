import 'package:flutter/material.dart';
import 'package:searchengine/bloc/news_bloc.dart';
import 'package:searchengine/bloc/news_provider.dart';
import 'package:searchengine/screen/news.dart';
import 'package:searchengine/util/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return NewsScreen(
      newsBloc: _createNewsBloc()
    );
  }

  NewsBloc _createNewsBloc() => NewsProvider.of(context);
}
