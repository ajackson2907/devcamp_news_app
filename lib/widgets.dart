import 'package:devcamp_news_app/news_list_model.dart';
import 'package:devcamp_news_app/topics_model.dart';
import 'package:devcamp_news_app/utilities.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsCategory extends StatelessWidget {
  const NewsCategory({
    Key? key,
    required this.newsTopic,
  }) : super(key: key);

  final Topics newsTopic;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: AssetImage(newsTopic.imageUrl)),
              ),
            ),
          ),
          const Spacer(),
          Text(newsTopic.name),
          const Spacer(),
        ],
      ),
    );
  }
}

class NewsListTile extends StatelessWidget {
  const NewsListTile({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() => context.go('/articleDetails', extra: article)),
      minLeadingWidth: 0,
      leading: SizedBox(
        height: double.infinity,
        child: CircleAvatar(backgroundImage: NetworkImage(article.image!)),
      ),
      title: Text(article.title!),
      subtitle: Text('Published on: ${Utilities.displayDate(article.publishedAt!)}'),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
