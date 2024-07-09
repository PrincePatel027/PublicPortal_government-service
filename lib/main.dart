import 'package:flutter/material.dart';
import 'package:government_services/provider/bookmark_provider.dart';
import 'package:government_services/provider/search_provider.dart';
import 'package:government_services/screens/pages/detail_page.dart';
import 'package:government_services/screens/pages/home_pgae.dart';
import 'package:government_services/screens/pages/search_page.dart';
import 'package:government_services/screens/pages/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookmarkProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'custom',
        ),
        initialRoute: 'splash',
        routes: {
          'splash': (_) => const SplashScreen(),
          '/': (_) => const HomePage(),
          'search': (_) => const SearchPage(),
          'detailPage': (_) => const DetailPage(),
        },
      ),
    );
  }
}
