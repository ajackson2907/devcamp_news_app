import 'package:devcamp_news_app/constants.dart';
import 'package:devcamp_news_app/http_service.dart';
import 'package:devcamp_news_app/news_list_model.dart';
import 'package:devcamp_news_app/utilities.dart';
import 'package:devcamp_news_app/widgets.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String country = 'gb';
  String language = 'en';
  TextEditingController controller = TextEditingController(text: '');
  NewsList? searchResults;
  String? query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          centerTitle: true,
          title: const Text('News Search'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onFieldSubmitted: (String value) async {
                  if (value.isNotEmpty) {
                    query = value;
                    var result = await NewsHttpService().fetchSearchedNews(value, country, language);
                    setState(() {
                      searchResults = result;
                    });
                  }
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  isDense: true,
                  hintText: 'Enter search query',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                ),
              ),
            ),
          ),
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (searchResults == null) ...[
                  const Text(searchInstructions),
                ],
                if (searchResults != null && searchResults!.articles == null) ...[
                  Text("No results found for the query: '$query'.")
                ],
                if (searchResults != null && searchResults!.articles != null) ...[
                  const SizedBox(height: 8),
                  HeaderText(text: "'$query' Search Results"),
                  const SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: searchResults!.articles!.length,
                    itemBuilder: ((context, index) {
                      final article = searchResults!.articles![index];
                      return NewsListTile(article: article);
                    }),
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(color: Color.fromARGB(255, 128, 128, 128));
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
