import 'package:devcamp_news_app/topics_model.dart';

const languages = {
  "Arabic": "ar",
  "Chinese": "zh",
  "Dutch": "nl",
  "English": "en",
  "German": "de",
  "Greek": "el",
  "French": "fr",
  "Hebrew": "he",
  "Hindi": "hi",
  "Italian": "it",
  "Japanese": "ja",
  "Malayalam": "ml",
  "Marathi": "mr",
  "Norwegian": "no",
  "Portuguese": "pt",
  "Romanian": "ro",
  "Russian": "ru",
  "Spanish": "es",
  "Swedish": "sv",
  "Tamil": "ta",
  "Telugu": "te",
  "Ukrainian": "uk",
};

const countries = {
  "Australia": "au",
  "Brazil": "br",
  "Canada": "ca",
  "China": "cn",
  "Egypt": "eg",
  "France": "fr",
  "Germany": "de",
  "Greece": "gr",
  "Hong Kong": "hk",
  "Ireland": "ie",
  "Israel": "il",
  "India": "in",
  "Italy": "it",
  "Japan": "jp",
  "Netherlands": "nl",
  "Norway": "no",
  "Peru": "pe",
  "Philippines": "ph",
  "Pakistan": "pk",
  "Portugal": "pt",
  "Romania": "ro",
  "Russian Federation": "ru",
  "Spain": "es",
  "Sweden": "se",
  "Switzerland": "ch",
  "Singapore": "sg",
  "Taiwan, Province of China": "tw",
  "Ukraine": "ua",
  "United Kingdom": "gb",
  "United States": "us",
};

final newsTopics = [
  Topics(name: 'Breaking News', searchName: 'breaking-news', imageUrl: 'assets/images/breakingNews.jpg'),
  Topics(name: 'World', searchName: 'world', imageUrl: 'assets/images/world.png'),
  Topics(name: 'Nation', searchName: 'nation', imageUrl: 'assets/images/nation.png'),
  Topics(name: 'Business', searchName: 'business', imageUrl: 'assets/images/business.png'),
  Topics(name: 'Technology', searchName: 'technology', imageUrl: 'assets/images/technology.png'),
  Topics(name: 'Entertainment', searchName: 'entertainment', imageUrl: 'assets/images/entertainment.png'),
  Topics(name: 'Sports', searchName: 'sports', imageUrl: 'assets/images/sports.png'),
  Topics(name: 'Science', searchName: 'science', imageUrl: 'assets/images/science.png'),
  Topics(name: 'Health', searchName: 'health', imageUrl: 'assets/images/health.png'),
];

const String lorem = '''


Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut faucibus magna. Nam vehicula scelerisque diam, a pulvinar nibh dignissim in. Praesent ullamcorper porta mauris, ac cursus arcu. Cras vitae lacinia nisi, in dictum nulla. Vivamus sed iaculis odio, eget mollis nibh. Aenean porttitor dapibus nibh id dictum. Mauris pulvinar neque non sodales mollis.

Phasellus ullamcorper est non elit pulvinar, eu sagittis nunc blandit. Suspendisse consectetur massa id ipsum sodales porta. Phasellus auctor gravida felis, ut aliquam leo efficitur vitae. Curabitur viverra non lorem non auctor. Suspendisse pharetra mi non lacus aliquet, id consectetur quam finibus. Aliquam nec elit non tellus molestie mattis sit amet quis dolor. Aenean et mi volutpat, sagittis arcu quis, pharetra velit. Suspendisse eu turpis non lorem consectetur aliquet. Praesent congue lacinia turpis porttitor varius.

Integer lectus odio, mattis in elit ut, sagittis tincidunt eros. In enim sem, commodo finibus auctor eget, tristique ac felis. Vestibulum fringilla vulputate odio. Integer tempor nulla metus, in semper tellus luctus nec. Aenean id mattis nibh. Donec at laoreet metus. Maecenas blandit et tellus consequat volutpat. Cras eu sagittis sem, placerat elementum tellus. Vivamus pulvinar euismod diam, a ultricies metus consectetur quis. Donec facilisis et turpis ac efficitur.

Vivamus ipsum nulla, dignissim quis libero vel, aliquam congue elit. Nam finibus mollis pretium. Aenean consectetur dapibus tortor, ac tincidunt nibh tempor at. Donec nulla urna, lacinia vitae eleifend sagittis, efficitur eu nulla. Cras feugiat ac ipsum ac blandit. Ut vel lectus eget metus rutrum pharetra sed eget sem. Proin augue leo, luctus nec porttitor convallis, euismod ac leo. Sed iaculis, ipsum at dapibus blandit, dolor nisi luctus leo, rhoncus convallis urna ligula id ligula. Donec dictum ipsum nec orci viverra consequat sit amet in orci.

Proin tincidunt sed urna at laoreet. Ut fringilla at enim faucibus pellentesque. Morbi id sagittis quam. Suspendisse est turpis, fringilla vitae libero ut, aliquam auctor velit. In vitae nibh venenatis, vehicula sem at, vestibulum felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse ultricies lectus neque, non pulvinar tortor dictum et. In tristique, elit non porta ultrices, nisi risus ultrices felis, ac feugiat est purus in lectus.
''';

const String searchInstructions = '''

Search Operators
Note
1. The query must be URL-encoded.

2. You cannot use other characters than alphabetic characters outside of quotes context. e.g.

Invalid: Hello! Left - Right Question?
Valid: "Hello!" "Left - Right" "Question?"

Phrase search operator (Exact match)
To use the phrase search operator surrounds your phrase with quotes like so "Apple iPhone".

Operator AND
There are two ways to use the AND operator.

Add this  AND  between each word or phrase (e.g. Apple AND Microsoft)
Add a space between each word or phrase (e.g. Apple Microsoft)

Operator OR
First of all, note that the operator OR has a higher precedence than the operator AND. To use the OR operator add this  OR  between each word or phrase (e.g. Apple OR Microsoft).

Due to the higher precedence of the operator OR the following query will not work as expected Apple AND iPhone OR Microsoft. When we read this expression we thought that the query will look first for articles that contain the word Apple and iPhone and then if no article found, look for articles that contain Microsoft. Actually this is not what is going to happen the OR will be executed first so the result will make no sense because the query will look for Apple AND iPhone or Apple AND Microsoft. To fix this query we have to add parenthesises, like so (Apple AND iPhone) OR Microsoft.

Operator NOT
To use the NOT operator add this NOT before each word or phrase (e.g. Apple AND NOT iPhone). Articles that contain the word iPhone will be removed from the results.

Examples of queries:

Microsoft Windows 10
Apple OR Microsoft
Apple AND NOT iPhone
(Windows 7) AND (Windows 10)
"Apple iPhone X" AND NOT "Apple iPhone 7"
Intel AND (i7 OR i9)
(Intel AND (i7 OR "i9-10900K")) AND NOT AMD AND NOT "i7-9700K"
''';
