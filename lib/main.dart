import 'package:devcamp_news_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    if (SchedulerBinding.instance.window.platformBrightness == Brightness.light) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    if (SchedulerBinding.instance.window.platformBrightness == Brightness.light) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    setState(() {});
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme lightColorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF558BC2),
      brightness: Brightness.light,
    );
    final ColorScheme darkColorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF558BC2),
      brightness: Brightness.dark,
    );

    return MaterialApp.router(
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      theme: ThemeData.from(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.from(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
    );
  }
}
