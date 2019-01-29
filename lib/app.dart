import 'package:flutter/material.dart';
import 'package:searchengine/bloc/news_provider.dart';
import 'package:searchengine/util/constants.dart';
import 'package:searchengine/screen/home.dart';

class SearchEngineApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return NewsProvider(
      child: MaterialApp(
        title: Constants.APP_NAME,
        theme: ThemeData.light(),
        home: HomeScreen(),
      ),
    );
  }
}