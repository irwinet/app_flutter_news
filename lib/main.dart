import 'package:app_flutter_news/src/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_news/src/theme/theme.dart';
import 'package:app_flutter_news/src/pages/tabs_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> new NewsService(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        title: 'Material App',
        home: TabsPage(),
      ),
    );
  }
}