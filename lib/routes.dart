import 'package:devcamp_news_app/article_details.dart';
import 'package:devcamp_news_app/main.dart';
import 'package:devcamp_news_app/news_list_model.dart';
import 'package:devcamp_news_app/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final home = GoRoute(
    path: '/',
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const HomeScreen(),
    ),
    routes: [
      search,
      articleDetails,
    ],
  );

  static final search = GoRoute(
      path: 'search',
      pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const SearchScreen(),
          ),
      routes: [
        articleDetails,
      ]);

  static final articleDetails = GoRoute(
    path: 'articleDetails',
    pageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ArticleDetails(
        article: state.extra! as Articles,
      ),
    ),
  );
}
