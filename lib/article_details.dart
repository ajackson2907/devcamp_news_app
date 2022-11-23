import 'package:devcamp_news_app/constants.dart';
import 'package:devcamp_news_app/news_list_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatefulWidget {
  const ArticleDetails({super.key, required this.article});

  final Articles article;

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  String country = 'gb';
  String language = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.article.source?.name ?? ""),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(widget.article.image!),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: RichText(
                    text: TextSpan(
                      text: widget.article.title!,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                      children: [
                        const TextSpan(text: ' - '),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () => _launchUrl(Uri.parse(widget.article.url!)),
                          text: 'Open article in a browser',
                          style: const TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            color: Color(0xFF00B0FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('${widget.article.content!} $lorem'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
