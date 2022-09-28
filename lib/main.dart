import 'package:devcamp_news_app/constants.dart';
import 'package:devcamp_news_app/http_service.dart';
import 'package:devcamp_news_app/news_list_model.dart';
import 'package:devcamp_news_app/router.dart';
import 'package:devcamp_news_app/test.dart';
import 'package:devcamp_news_app/topics_model.dart';
import 'package:devcamp_news_app/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF558BC2),
      brightness: Brightness.dark,
    );

    return MaterialApp.router(
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      theme: ThemeData.from(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String country = 'gb';
  String language = 'en';
  Topics topic = newsTopics[0];

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
            icon: const Icon(Icons.search, color: Colors.white)),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                country = value;
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
            }),
            icon: Text(
              Utilities.getLanguageSymbol(language),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
        future: _fetchTopHeadlines(country, language, topic),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator.adaptive(),
                  SizedBox(height: 16),
                  Text('Downloading...', style: TextStyle(fontSize: 18)),
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
          const Text(
            'Top Headline Categories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
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
                  child: Card(
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
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${topic.name} Headlines',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
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
                }),
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Color(0x66FFFFFF),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<NewsList> _fetchTopHeadlines(String country, String language, Topics topic) async {
    // await Future.delayed(const Duration(seconds: 1));
    // return testData;
    return NewsHttpService().fetchTopHeadlineNews(country, language, topic);
  }

  _setNewTopic(Topics newTopic) {
    setState(() {
      topic = newTopic;
    });
  }
}
