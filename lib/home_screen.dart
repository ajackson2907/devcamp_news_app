import 'package:devcamp_news_app/constants.dart';
import 'package:devcamp_news_app/http_service.dart';
import 'package:devcamp_news_app/news_list_model.dart';
import 'package:devcamp_news_app/topics_model.dart';
import 'package:devcamp_news_app/utilities.dart';
import 'package:devcamp_news_app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String country = 'gb';
  String language = 'en';
  Topics topic = newsTopics[0];
  late Future<NewsList?> fecthedNewsList;

  @override
  void initState() {
    super.initState();
    fecthedNewsList = _fetchTopHeadlines(country, language, topic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Top Headlines'),
        leading: IconButton(
            onPressed: () {
              context.go('/search');
            },
            icon: const Icon(Icons.search)),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                country = value;
                fecthedNewsList = _fetchTopHeadlines(country, language, topic);
              });
            },
            icon: Text(
              Utilities.getFlagEmoji(country),
              style: const TextStyle(fontSize: 24),
            ),
            tooltip: 'News by Country',
            itemBuilder: ((context) {
              List<PopupMenuItem> items = [];
              countries.forEach((key, value) {
                var item = PopupMenuItem(
                  value: value,
                  child: Text('${Utilities.getFlagEmoji(value)} $key'),
                );
                items.add(item);
              });
              return items;
            }),
          ),
          PopupMenuButton(
            onSelected: (value) => setState(() {
              language = value;
              fecthedNewsList = _fetchTopHeadlines(country, language, topic);
            }),
            icon: Text(
              Utilities.getLanguageSymbol(language),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            tooltip: 'Change Language',
            itemBuilder: ((context) {
              List<PopupMenuItem> items = [];
              languages.forEach((key, value) {
                var item = PopupMenuItem(
                  value: value,
                  child: Text('$key (${Utilities.getLanguageSymbol(value)})'),
                );
                items.add(item);
              });
              return items;
            }),
          ),
        ],
      ),
      body: FutureBuilder(
        future: fecthedNewsList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator.adaptive(),
                  SizedBox(height: 16),
                  HeaderText(text: 'Downloading...'),
                  SizedBox(height: 48),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Connection Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData && snapshot.data is NewsList) {
              return buildScreen(snapshot.data as NewsList);
            } else {
              return Center(child: Text('Has no error and data is: ${snapshot.data} (${snapshot.data.runtimeType})'));
            }
          } else {
            return const Center(child: Text('Connection Successful but no data'));
          }
        },
      ),
    );
  }

  Widget buildScreen(NewsList data) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderText(text: 'Top Headline Categories'),
          const SizedBox(height: 8),
          SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: newsTopics.length,
              itemBuilder: ((context, index) {
                var newsTopic = newsTopics[index];
                return InkWell(
                  onTap: () => _setNewTopic(newsTopic),
                  child: NewsCategory(newsTopic: newsTopic),
                );
              }),
            ),
          ),
          const SizedBox(height: 8),
          HeaderText(text: '${topic.name} Headlines'),
          const SizedBox(height: 8),
          if (data.articles!.isEmpty) ...[
            Text(
              'No articles have been retrieved with parameters:\nTopic: ${topic.name}\nCountry: ${Utilities.fetchCountryName(country)}\nLanguage: ${Utilities.fetchLanguageName(language)}\n\nMake sure that you have the matching language if you update the country and visa versa.',
              textAlign: TextAlign.center,
            ),
          ],
          if (data.articles!.isNotEmpty) ...[
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: data.articles!.length,
                itemBuilder: ((context, index) {
                  final article = data.articles![index];
                  return NewsListTile(article: article);
                }),
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(color: Color.fromARGB(255, 128, 128, 128));
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<NewsList?> _fetchTopHeadlines(String country, String language, Topics topic) async {
    // await Future.delayed(const Duration(seconds: 1));
    // return testData;
    return NewsHttpService().fetchTopHeadlineNews(country, language, topic);
  }

  _setNewTopic(Topics newTopic) {
    setState(() {
      topic = newTopic;
      fecthedNewsList = _fetchTopHeadlines(country, language, topic);
    });
  }
}
